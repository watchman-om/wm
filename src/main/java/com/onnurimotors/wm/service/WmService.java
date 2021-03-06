package com.onnurimotors.wm.service;

import java.io.IOException;
import java.io.Reader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.onnurimotors.wm.model.ALERT;
import com.onnurimotors.wm.model.EMPLOYEE;
import com.onnurimotors.wm.model.HISTORY;
import com.onnurimotors.wm.model.MANAGEMENT;
import com.onnurimotors.wm.model.MANAGEMENT_DATE;
import com.onnurimotors.wm.model.PARAMETER_HISTORY;
import com.onnurimotors.wm.model.PARAMETER_MANAGEMENT;
import com.onnurimotors.wm.model.PARAMETER_VEHICLE;
import com.onnurimotors.wm.model.VEHICLE;
import com.onnurimotors.wm.model.VEHICLE_HISTORY;
import com.onnurimotors.wm.model.HISTORY_MANAGEMENT;

@Service
@SuppressWarnings("unchecked")	// annotation which removes alerts generated by uncertain casting
public class WmService {

	@Autowired
	private PushService pService;
	
	public SqlSession sqlSession() {
        String resource = "mybatis-config.xml";
        try (Reader in = Resources.getResourceAsReader(resource)) {
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
            SqlSession session = factory.openSession();
            return session;
        } catch (IOException e) {
        }
		return null;
	}
	
	public Object visit(HttpServletRequest request) {
		SqlSession session = sqlSession();
		String license = request.getParameter("license").replaceAll("\\s+","");
		int is_new_customer;
		String title, msg;
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR_OF_DAY, 9);
		date = cal.getTime();
        DateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat format_time = new SimpleDateFormat("HH:mm:ss");
		VEHICLE vehicle = new VEHICLE();
		HISTORY history = new HISTORY();
		vehicle.setLICENSE(license);
		vehicle.setVEHICLE_ID(-1);
		
		// retrieve vehicle list which match license
        ArrayList<VEHICLE> result = (ArrayList<VEHICLE>) session.selectList("watchman.mybatis.selectVehicle", vehicle);
        
        // if there is no matched vehicle
        if(result.size() == 0) {
        	vehicle = new VEHICLE();
    		vehicle.setIS_NOTIFIABLE(1);
    		vehicle.setLICENSE(license);
			vehicle.setMODEL("");
			vehicle.setUSER_NAME("");
			vehicle.setBIRTH("");
			vehicle.setPHONE_NUMBER("");
			vehicle.setCOMMENT("");
        	session.insert("watchman.mybatis.insertVehicle", vehicle);
        	session.commit();
        	is_new_customer = 1;
        } else {
        	vehicle = result.get(0);
        	is_new_customer = 0;
        }
        
        history.setVEHICLE_ID(vehicle.getVEHICLE_ID());
        history.setDATE_VISIT(format_date.format(date));
        history.setTIME_VISIT(format_time.format(date));
        session.insert("watchman.mybatis.insertHistory", history);
        session.commit();
        
        // msg to app used by employee of onnurimotors
        title = "";
        msg = "";
        if(vehicle.getIS_NOTIFIABLE() == 1) {
        	if(is_new_customer == 0) {
        		title = title + "재방문 고객\n";
        		msg = msg + "재방문 고객\n";
        	} else {
        		title = title + "처음 방문한 고객\n";
        		msg = msg + "재방문 고객\n";
        	}
        	msg = msg + "차량번호: " + vehicle.getLICENSE() + "\n";
        	msg = msg + "차량모델: " + vehicle.getMODEL() + "\n";
        	msg = msg + "손님이름: " + vehicle.getUSER_NAME() + "\n";
        	msg = msg + "생년월일: " + vehicle.getBIRTH() + "\n";
        	msg = msg + "메모: " + vehicle.getCOMMENT() + "\n";
        	
            /*ArrayList<VEHICLE_HISTORY> result2 = (ArrayList<VEHICLE_HISTORY>) session.selectList("watchman.mybatis.selectAllHistoryVehicle", vehicle);
            for(int i = 0; i < result2.size(); i++) {
            	msg = msg + result2.get(i).getDATE_VISIT() + " " + result2.get(i).getTIME_VISIT() + "<br />";
            }*/
            
            PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
            parameter_vehicle.setVEHICLE_ID(vehicle.getVEHICLE_ID());
            ArrayList<MANAGEMENT_DATE> result3 = (ArrayList<MANAGEMENT_DATE>) session.selectList("watchman.mybatis.selectManagementDateOfVehicle", parameter_vehicle);
            msg = msg + "<점검 내역>\n";
            for(int i = 0; i < 10 && i < result3.size(); i++) {
            	msg = msg + result3.get(i).getDATE_VISIT() + " " + result3.get(i).getCOMMENT() + "\n";
            }
            
            ArrayList<EMPLOYEE> employees = (ArrayList<EMPLOYEE>) session.selectList("watchman.mybatis.selectReceivers");
            for(int i = 0; i < employees.size(); i++) {
            	pService.sendPushNotification(employees.get(i).getKAKAO_ACCOUNT(), title, msg);
            	pService.sendPush(employees.get(i).getKAKAO_ACCOUNT(), title, msg);
            }
        }
        
        session.close();
        
        // if is_notifiable is false, return empty message
        return msg;
	}

	public void index(Model model) {
		//getAlerts(model);
	}

	public void listVehicle(HttpServletRequest request, Model model) {
		//getAlerts(model);
		getVehicle(request, model, -1);
	}

	public Object getAlerts(Model model) {
		SqlSession session = sqlSession();
		ArrayList<ALERT> alerts = new ArrayList<ALERT>();
		ALERT alert;
		VEHICLE_HISTORY vh = new VEHICLE_HISTORY();
		long diff;
		Date date = new Date();
		DateFormat format_datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		ArrayList<VEHICLE_HISTORY> vhs = (ArrayList<VEHICLE_HISTORY>)session.selectList("watchman.mybatis.selectRecentHistoryVehicle");

		try {
			for(int i = 0; i < vhs.size(); i++) {
				alert = new ALERT();
				vh = vhs.get(i);
				String datetime_str = vh.getDATE_VISIT() + " " + vh.getTIME_VISIT();
				diff = (date.getTime() - format_datetime.parse(datetime_str).getTime()) / 1000;
				if(diff > 60) {
					diff = diff/60;
					if(diff > 60) {
						diff = diff/60;
						alert.setTIME_PASSED(diff+"시간 전");
					} else {
						alert.setTIME_PASSED(diff+"분 전");
					}
				} else {
					alert.setTIME_PASSED(diff+"초 전");
				}
				alert.setLICENSE(vh.getLICENSE());
				alerts.add(alert);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if(model != null) {
			model.addAttribute("alerts", alerts);
		}
		
		session.close();
		
		return alerts;
	}
	
	public Object getHistory(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		ArrayList<HISTORY> historys = null;
		PARAMETER_HISTORY param = new PARAMETER_HISTORY();
		
		String history_id = request.getParameter("HISTORY_ID");
		param.setHISTORY_ID(-1);
		if(history_id != null && !history_id.equals("")) {
			param.setHISTORY_ID(Integer.parseInt(history_id));
		}
		param.setDATE_VISIT("");
		param.setVEHICLE_ID(-1);
		
		String page = request.getParameter("PAGE");
		String size_page = request.getParameter("SIZE_PAGE");
		param.setPAGE(0);
		param.setSIZE_PAGE(10);
		if(page != null && !page.equals("")) {
			if(size_page != null && !size_page.equals("")) {
				param.setPAGE((Integer.parseInt(page)-1) * Integer.parseInt(size_page));
				param.setSIZE_PAGE(Integer.parseInt(size_page));
			} else {
				param.setPAGE((Integer.parseInt(page)-1) * 10);
			}
			historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectHistory", param);
		} else if(size_page != null && !size_page.equals("")) {
			param.setSIZE_PAGE(Integer.parseInt(size_page));
			historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectHistory", param);
		} else {
			historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectAllHistory", param);
		}
		
		if(model != null) {
			model.addAttribute("historys", historys);
		}
		
		session.close();
		
		return historys;
	}

	public Object getVehicle(HttpServletRequest request, Model model, int vid) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		vehicle.setLICENSE("");
		vehicle.setVEHICLE_ID(-1);
		if(request != null) {
			String license = request.getParameter("license");
			String vehicle_id = request.getParameter("vehicle_id");
			if(license != null && !license.equals("")) {
				vehicle.setLICENSE("%"+license+"%");
				if(model != null) {
					model.addAttribute("license", license);
				}
			} else {
				if(model != null) {
					model.addAttribute("license", "");
				}
			}
			if(vehicle_id != null && !vehicle_id.equals("")) {
				vehicle.setVEHICLE_ID(Integer.parseInt(vehicle_id));
			}
		}
		if(vid != -1) {
			vehicle.setVEHICLE_ID(vid);
		}
		List<VEHICLE> vehicles = (ArrayList<VEHICLE>) session.selectList("watchman.mybatis.selectVehicle", vehicle);
		
		if(model != null) {
			model.addAttribute("vehicles", vehicles);
		}
		
		session.close();
		
		return vehicles;
	}

	public void dbViewer(Model model) {
		getVehicle(null, model, -1);
	}

	public Object getHistoryManagement(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		HISTORY_MANAGEMENT history_management = new HISTORY_MANAGEMENT();
		history_management.setDATE_VISIT("");
		history_management.setMANAGEMENT_ID(-1);
		ArrayList<HISTORY_MANAGEMENT> history_managements = (ArrayList<HISTORY_MANAGEMENT>) session.selectList("watchman.mybatis.selectHistoryManagement", history_management);
		
		if(model != null) {
			model.addAttribute("history_managements", history_managements);
		}
		
		session.close();
		
		return history_managements;
	}


	public Object getManagement(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		MANAGEMENT management = new MANAGEMENT();
		management.setMANAGEMENT_ID(-1);
		ArrayList<MANAGEMENT> managements = (ArrayList<MANAGEMENT>) session.selectList("watchman.mybatis.selectManagement", management);
		
		if(model != null) {
			model.addAttribute("vehicle_managements", managements);
		}
		
		session.close();
		
		return managements;
	}

	public Object listHistory(HttpServletRequest request, Model model, int hid) {
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		String license = request.getParameter("license");
		String fdate = request.getParameter("fdate");
		String tdate = request.getParameter("tdate");
		String flimit = request.getParameter("flimit");
		String nlimit = request.getParameter("nlimit");
		parameter_vehicle.setHISTORY_ID(hid);
		if(license != null && !license.equals("")) {
			parameter_vehicle.setLICENSE(license);
		} else {
			parameter_vehicle.setLICENSE("");
		}
		if(fdate != null && !fdate.equals("")) {
			parameter_vehicle.setFROM_DATE(fdate);
		} else {
			parameter_vehicle.setFROM_DATE("");
		}
		if(tdate != null && !tdate.equals("")) {
			parameter_vehicle.setTO_DATE(tdate);
		} else {
			parameter_vehicle.setTO_DATE("");
		}
		if(flimit != null && !flimit.equals("")) {
			parameter_vehicle.setFROM_LIMIT(Integer.parseInt(flimit));
		} else {
			parameter_vehicle.setFROM_LIMIT(0);
		}
		if(nlimit != null && !nlimit.equals("")) {
			parameter_vehicle.setNUM_LIMIT(Integer.parseInt(nlimit));
		} else {
			parameter_vehicle.setNUM_LIMIT(10);
		}
		
		ArrayList<VEHICLE_HISTORY> vhs = (ArrayList<VEHICLE_HISTORY>)session.selectList("watchman.mybatis.selectHistoryVehicleCondition", parameter_vehicle);
		
		if(model != null) {
			model.addAttribute("histories", vhs);
		}
		
		session.close();
		
		return vhs;
	}
	
	public ResponseBodyEmitter sseHistory(HttpServletRequest request) {
        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
        	try {
        		emitter.send(listHistory(request, null, -1));
                Thread.sleep(2000);
        	} catch (Exception e) {
        		e.printStackTrace();
        		emitter.completeWithError(e);
        		return;
        	}
        	emitter.complete();
        });

        return emitter;
	}

	public void getManagementCondition(HttpServletRequest request, Model model) {
		if(request != null && request.getParameter("is_new") != null && request.getParameter("is_new").equals("1")) {
			return;
		}
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		String vehicle_id = request.getParameter("vehicle_id");
		String management_id = request.getParameter("management_id");
		if(vehicle_id != null && !vehicle_id.equals("")) {
			parameter_vehicle.setVEHICLE_ID(Integer.parseInt(vehicle_id));
		} else {
			parameter_vehicle.setVEHICLE_ID(-1);
		}
		if(management_id != null && !management_id.equals("")) {
			parameter_vehicle.setMANAGEMENT_ID(Integer.parseInt(management_id));
		} else {
			parameter_vehicle.setMANAGEMENT_ID(-1);
		}
		
		List<MANAGEMENT> managements = (ArrayList<MANAGEMENT>)session.selectList("watchman.mybatis.selectManagementOfVehicle", parameter_vehicle);
		
		System.out.println("managements size: " + managements.size());
		
		model.addAttribute("managements", managements);
		
		session.close();
	}
	
	public void listManagement(HttpServletRequest request, Model model) {
		getVehicle(request, model, -1);
		getManagementCondition(request, model);
	}

	public VEHICLE toggleNotifiable(HttpServletRequest request) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		String is_notifiable = request.getParameter("IS_NOTIFIABLE");
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		if(is_notifiable.equals("on")) {
			vehicle.setIS_NOTIFIABLE(0);
		} else {
			vehicle.setIS_NOTIFIABLE(1);
		}
		session.update("watchman.mybatis.updateVehicleIsNotifiable", vehicle);
		session.commit();
		
		session.close();
		
		return vehicle;
	}

	public VEHICLE updateVehicleModel(HttpServletRequest request) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		String model = request.getParameter("MODEL");
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		vehicle.setMODEL(model);
		session.update("watchman.mybatis.updateVehicleModel", vehicle);
		session.commit();
		
		session.close();

		return vehicle;
	}
	
	public MANAGEMENT submitManagement(HttpServletRequest request) {
		SqlSession session = sqlSession();
		MANAGEMENT management = new MANAGEMENT();
		management.setCOMMENT(request.getParameter("COMMENT"));
		if(request.getParameter("IS_NEW").equals("1")) {
			HISTORY_MANAGEMENT hm = new HISTORY_MANAGEMENT();
			session.insert("watchman.mybatis.insertManagement", management);
			session.commit();
			hm.setMANAGEMENT_ID(management.getMANAGEMENT_ID());
			hm.setDATE_VISIT(request.getParameter("DATE_VISIT"));
			hm.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
			session.insert("watchman.mybatis.insertHistoryManagement", hm);
			session.commit();
		} else {
			management.setMANAGEMENT_ID(Integer.parseInt(request.getParameter("MANAGEMENT_ID")));
			session.update("watchman.mybatis.updateManagement", management);
			session.commit();
		}
		session.close();
		
		return management;
	}

	public VEHICLE getOneVehicle(int vehicle_id) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		vehicle.setVEHICLE_ID(vehicle_id);
		vehicle.setLICENSE("");
		vehicle = (VEHICLE) session.selectOne("watchman.mybatis.selectVehicle", vehicle);
		
		session.close();
		
		return vehicle;
	}

	public Object insertVehicle(HttpServletRequest request) {
		SqlSession session = sqlSession();
		ArrayList<VEHICLE> vehicles = null;
		VEHICLE vehicle = new VEHICLE();
		vehicle.setLICENSE(request.getParameter("LICENSE"));
		vehicle.setVEHICLE_ID(-1);
		vehicles = (ArrayList<VEHICLE>) session.selectList("watchman.mybatis.selectVehicle", vehicle);
		if(vehicles.size() == 0) {
			vehicle.setIS_NOTIFIABLE(Integer.parseInt(request.getParameter("IS_NOTIFIABLE")));
			String model = request.getParameter("MODEL");
			if(model != null && !model.equals("")) {
				vehicle.setMODEL(model);
			} else {
				vehicle.setMODEL("");
			}
			String user_name = request.getParameter("USER_NAME");
			if(user_name != null && !user_name.equals("")) {
				vehicle.setUSER_NAME(user_name);
			} else {
				vehicle.setUSER_NAME("");
			}
			String birth = request.getParameter("BIRTH");
			if(birth != null && !birth.equals("")) {
				vehicle.setBIRTH(birth);
			} else {
				vehicle.setBIRTH("");
			}
			String phone_number = request.getParameter("PHONE_NUMBER");
			if(phone_number != null && !phone_number.equals("")) {
				vehicle.setPHONE_NUMBER(phone_number);
			} else {
				vehicle.setPHONE_NUMBER("");
			}
			String comment = request.getParameter("COMMENT");
			if(comment != null && !comment.equals("")) {
				vehicle.setCOMMENT(comment);
			} else {
				vehicle.setCOMMENT("");
			}
			session.insert("watchman.mybatis.insertVehicle", vehicle);
			session.commit();
		}
		else {
			vehicle.setIS_NOTIFIABLE(-1);
		}
		
		session.close();
		
		return vehicle;
	}

	public Object updateVehicle(HttpServletRequest request, int vid) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();

		vehicle.setVEHICLE_ID(vid);
		if(vid == -1) {
			vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		}
		vehicle.setIS_NOTIFIABLE(Integer.parseInt(request.getParameter("IS_NOTIFIABLE")));
		vehicle.setMODEL(request.getParameter("MODEL"));
		vehicle.setUSER_NAME(request.getParameter("USER_NAME"));
		vehicle.setBIRTH(request.getParameter("BIRTH"));
		vehicle.setPHONE_NUMBER(request.getParameter("PHONE_NUMBER"));
		vehicle.setCOMMENT(request.getParameter("COMMENT"));
		
		session.update("watchman.mybatis.updateVehicle", vehicle);
		session.commit();
		
		session.close();
		
		return vehicle;
	}
	
	public Object deleteVehicle(int vehicle_id) {
		VEHICLE vehicle = new VEHICLE();
		vehicle.setVEHICLE_ID(vehicle_id);
		deleteHistoryByVehicle(vehicle_id);
		SqlSession session = sqlSession();
		session.delete("watchman.mybatis.deleteVehicle", vehicle);
		session.commit();
		
		session.close();
		
		return vehicle;
	}

	public Object getVehicleCondition(HttpServletRequest request, Model model) {
		if(request != null && request.getParameter("is_new") != null && request.getParameter("is_new").equals("1")) {
			return null;
		}
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("vehicle_id")));
		vehicle.setLICENSE("");
		ArrayList<VEHICLE> vehicles = (ArrayList<VEHICLE>) session.selectList("watchman.mybatis.selectVehicle", vehicle);
		
		session.close();
		
		model.addAttribute("vehicles", vehicles);
		
		return vehicles;
	}

	public Object getVehicleHistory(HttpServletRequest request) {
		SqlSession session = sqlSession();
		ArrayList<VEHICLE_HISTORY> historys = null;
		PARAMETER_HISTORY param = new PARAMETER_HISTORY();
		
		String history_id = request.getParameter("HISTORY_ID");
		param.setHISTORY_ID(-1);
		if(history_id != null && !history_id.equals("")) {
			param.setHISTORY_ID(Integer.parseInt(history_id));
		}
		param.setDATE_VISIT("");
		param.setVEHICLE_ID(-1);
		
		String page = request.getParameter("PAGE");
		String size_page = request.getParameter("SIZE_PAGE");
		param.setPAGE(0);
		param.setSIZE_PAGE(10);
		if(page != null && !page.equals("")) {
			if(size_page != null && !size_page.equals("")) {
				param.setPAGE((Integer.parseInt(page)-1) * Integer.parseInt(size_page));
				param.setSIZE_PAGE(Integer.parseInt(size_page));
			} else {
				param.setPAGE((Integer.parseInt(page)-1) * 10);
			}
		} else if(size_page != null && !size_page.equals("")) {
			param.setSIZE_PAGE(Integer.parseInt(size_page));
		}
		
		historys = (ArrayList<VEHICLE_HISTORY>) session.selectList("watchman.mybatis.selectHistory", param);
		
		session.close();
		
		return historys;
	}

	public Object deleteHistory(HttpServletRequest request, Model model, int hid) {
		SqlSession session = sqlSession();
		PARAMETER_HISTORY parameter_history = new PARAMETER_HISTORY();
		parameter_history.setHISTORY_ID(hid);
		parameter_history.setDATE_VISIT("");
		parameter_history.setVEHICLE_ID(-1);
		parameter_history.setPAGE(0);
		parameter_history.setSIZE_PAGE(1);
		HISTORY history = (HISTORY) session.selectOne("watchman.mybatis.selectHistory", parameter_history);
		session.delete("watchman.mybatis.deleteHistory", history);
		session.commit();
		
		HISTORY_MANAGEMENT hm = new HISTORY_MANAGEMENT();
		hm.setMANAGEMENT_ID(-1);
		hm.setDATE_VISIT(history.getDATE_VISIT());
		hm.setVEHICLE_ID(history.getVEHICLE_ID());
		System.out.println(hm.getDATE_VISIT()+":"+hm.getVEHICLE_ID()+":"+hm.getMANAGEMENT_ID());
		session.delete("watchman.mybatis.deleteManagement", hm);
		session.commit();
		
		session.delete("watchman.mybatis.deleteHistoryManagement", hm);
		session.commit();
		
		session.close();
		
		return history;
	}
	
	public ResponseBodyEmitter sseHistoryCount(HttpServletRequest request) {
        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
        	try {
        		emitter.send(getHistoryCount(request));
                Thread.sleep(2000);
        	} catch (Exception e) {
        		e.printStackTrace();
        		emitter.completeWithError(e);
        		return;
        	}
        	emitter.complete();
        });

        return emitter;
	}

	private int getHistoryCount(HttpServletRequest request) {
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		String fdate = request.getParameter("fdate");
		String tdate = request.getParameter("tdate");
		if(fdate != null && !fdate.equals("")) {
			parameter_vehicle.setFROM_DATE(fdate);
		} else {
			parameter_vehicle.setFROM_DATE("");
		}
		if(tdate != null && !tdate.equals("")) {
			parameter_vehicle.setTO_DATE(tdate);
		} else {
			parameter_vehicle.setTO_DATE("");
		}
		ArrayList<HISTORY> historys = (ArrayList<HISTORY>)session.selectList("watchman.mybatis.selectAllHistoryInDate", parameter_vehicle);
		session.close();
		return historys.size();
	}

	public ResponseBodyEmitter sseVehicle(HttpServletRequest request) {
        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
        	try {
        		emitter.send(getVehiclePage(request, null));
                Thread.sleep(2000);
        	} catch (Exception e) {
        		e.printStackTrace();
        		emitter.completeWithError(e);
        		return;
        	}
        	emitter.complete();
        });

        return emitter;
	}

	public ResponseBodyEmitter sseVehicleCount(HttpServletRequest request) {
        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
        	try {
        		emitter.send(getVehicleCount(request));
                Thread.sleep(2000);
        	} catch (Exception e) {
        		e.printStackTrace();
        		emitter.completeWithError(e);
        		return;
        	}
        	emitter.complete();
        });

        return emitter;
	}

	private int getVehicleCount(HttpServletRequest request) {
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		String license = request.getParameter("license");
		String vehicle_id = request.getParameter("vehicle_id");
		String flimit = request.getParameter("flimit");
		String nlimit = request.getParameter("nlimit");
		parameter_vehicle.setLICENSE("");
		parameter_vehicle.setVEHICLE_ID(-1);
		parameter_vehicle.setFROM_LIMIT(0);
		parameter_vehicle.setNUM_LIMIT(10);
		if(license != null && !license.equals("")) {
			parameter_vehicle.setLICENSE(license);
		}
		if(vehicle_id != null && !vehicle_id.equals("")) {
			parameter_vehicle.setVEHICLE_ID(Integer.parseInt(vehicle_id));
		}
		if(flimit != null && !flimit.equals("")) {
			parameter_vehicle.setFROM_LIMIT(Integer.parseInt(flimit));
		}
		if(nlimit != null && !nlimit.equals("")) {
			parameter_vehicle.setNUM_LIMIT(Integer.parseInt(nlimit));
		}
		ArrayList<HISTORY> historys = (ArrayList<HISTORY>)session.selectList("watchman.mybatis.selectAllVehicle", parameter_vehicle);
		session.close();
		return historys.size();
	}

	public Object getVehiclePage(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		if(request != null) {
			String license = request.getParameter("license");
			String vehicle_id = request.getParameter("vehicle_id");
			String flimit = request.getParameter("flimit");
			String nlimit = request.getParameter("nlimit");
			parameter_vehicle.setLICENSE("");
			parameter_vehicle.setVEHICLE_ID(-1);
			parameter_vehicle.setFROM_LIMIT(0);
			parameter_vehicle.setNUM_LIMIT(10);
			if(license != null && !license.equals("")) {
				parameter_vehicle.setLICENSE("%"+license+"%");
			}
			if(vehicle_id != null && !vehicle_id.equals("")) {
				parameter_vehicle.setVEHICLE_ID(Integer.parseInt(vehicle_id));
			}
			if(flimit != null && !flimit.equals("")) {
				parameter_vehicle.setFROM_LIMIT(Integer.parseInt(flimit));
			}
			if(nlimit != null && !nlimit.equals("")) {
				parameter_vehicle.setNUM_LIMIT(Integer.parseInt(nlimit));
			}
		}
		ArrayList<VEHICLE> vehicles = (ArrayList<VEHICLE>) session.selectList("watchman.mybatis.selectVehiclePage", parameter_vehicle);
		
		if(model != null) {
			model.addAttribute("vehicles", vehicles);
		}
		
		session.close();
		
		return vehicles;
	}

	public VEHICLE updateVehicleUserName(HttpServletRequest request) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		String user_name = request.getParameter("USER_NAME");
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		vehicle.setUSER_NAME(user_name);
		session.update("watchman.mybatis.updateVehicleUserName", vehicle);
		session.commit();
		
		session.close();

		return vehicle;
	}

	public VEHICLE updateVehiclePhoneNumber(HttpServletRequest request) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		String phone_number = request.getParameter("PHONE_NUMBER");
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		vehicle.setPHONE_NUMBER(phone_number);
		session.update("watchman.mybatis.updateVehiclePhoneNumber", vehicle);
		session.commit();
		
		session.close();

		return vehicle;
	}

	public VEHICLE updateVehicleBirth(HttpServletRequest request) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		String birth = request.getParameter("BIRTH");
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		vehicle.setBIRTH(birth);
		session.update("watchman.mybatis.updateVehicleBirth", vehicle);
		session.commit();
		
		session.close();

		return vehicle;
	}

	public VEHICLE updateVehicleComment(HttpServletRequest request) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		String comment = request.getParameter("COMMENT");
		vehicle.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
		vehicle.setCOMMENT(comment);
		session.update("watchman.mybatis.updateVehicleComment", vehicle);
		session.commit();
		
		session.close();

		return vehicle;
	}

	public void deleteManagement(int mid) {
		HISTORY_MANAGEMENT hm = new HISTORY_MANAGEMENT();
		hm.setMANAGEMENT_ID(mid);
		hm.setVEHICLE_ID(-1);
		hm.setDATE_VISIT("");
		
		deleteHistoryManagement(hm);
		
		SqlSession session = sqlSession();
		session.delete("watchman.mybatis.deleteManagement", hm);
		session.commit();
		
		session.close();
	}
	
	public void deleteManagementByVehicle(HISTORY_MANAGEMENT hm) {
		SqlSession session = sqlSession();
		hm.setMANAGEMENT_ID(-1);
		session.delete("watchman.mybatis.deleteManagement", hm);
		session.commit();
		session.close();
	}

	private void deleteHistoryManagement(HISTORY_MANAGEMENT hm) {
		SqlSession session = sqlSession();
		session.delete("watchman.mybatis.deleteHistoryManagement", hm);
		session.commit();
		session.close();
	}

	public ResponseBodyEmitter sseEmployee(HttpServletRequest request) {
        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
        	try {
        		emitter.send(getEmployeePage(request, null));
                Thread.sleep(2000);
        	} catch (Exception e) {
        		e.printStackTrace();
        		emitter.completeWithError(e);
        		return;
        	}
        	emitter.complete();
        });

        return emitter;
	}

	public ResponseBodyEmitter sseEmployeeCount(HttpServletRequest request) {
        final SseEmitter emitter = new SseEmitter();
        ExecutorService executorService = Executors.newSingleThreadExecutor();
        executorService.execute(() -> {
        	try {
        		emitter.send(getEmployeeCount(request));
                Thread.sleep(2000);
        	} catch (Exception e) {
        		e.printStackTrace();
        		emitter.completeWithError(e);
        		return;
        	}
        	emitter.complete();
        });

        return emitter;
	}

	public Object getEmployeePage(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		EMPLOYEE employee = new EMPLOYEE();
		if(request != null) {
			String name = request.getParameter("name");
			String employee_id = request.getParameter("employee_id");
			String flimit = request.getParameter("flimit");
			String nlimit = request.getParameter("nlimit");
			employee.setNAME("");
			employee.setEMPLOYEE_ID(-1);
			employee.setFROM_LIMIT(0);
			employee.setNUM_LIMIT(10);
			if(name != null && !name.equals("")) {
				employee.setNAME(name);
			}
			if(employee_id != null && !employee_id.equals("")) {
				employee.setEMPLOYEE_ID(Integer.parseInt(employee_id));
			}
			if(flimit != null && !flimit.equals("")) {
				employee.setFROM_LIMIT(Integer.parseInt(flimit));
			}
			if(nlimit != null && !nlimit.equals("")) {
				employee.setNUM_LIMIT(Integer.parseInt(nlimit));
			}
		}
		ArrayList<EMPLOYEE> employees = (ArrayList<EMPLOYEE>) session.selectList("watchman.mybatis.selectEmployeePage", employee);
		
		if(model != null) {
			model.addAttribute("vehicles", employees);
		}
		
		session.close();
		
		return employees;
	}

	private int getEmployeeCount(HttpServletRequest request) {
		SqlSession session = sqlSession();
		EMPLOYEE employee = new EMPLOYEE();
		String name = request.getParameter("name");
		String employee_id = request.getParameter("employee_id");
		employee.setNAME("");
		employee.setEMPLOYEE_ID(-1);
		if(name != null && !name.equals("")) {
			employee.setNAME(name);
		}
		if(employee_id != null && !employee_id.equals("")) {
			employee.setEMPLOYEE_ID(Integer.parseInt(employee_id));
		}
		ArrayList<EMPLOYEE> employees = (ArrayList<EMPLOYEE>)session.selectList("watchman.mybatis.selectAllEmployee", employee);
		session.close();
		return employees.size();
	}

	public Object toggleReceivingKakao(HttpServletRequest request) {
		SqlSession session = sqlSession();
		EMPLOYEE employee = new EMPLOYEE();
		String is_receiving_kakao = request.getParameter("IS_RECEIVING_KAKAO");
		employee.setEMPLOYEE_ID(Integer.parseInt(request.getParameter("EMPLOYEE_ID")));
		if(is_receiving_kakao.equals("on")) {
			employee.setIS_RECEIVING_KAKAO(0);
		} else {
			employee.setIS_RECEIVING_KAKAO(1);
		}
		session.update("watchman.mybatis.updateEmployeeIsReceivingKakao", employee);
		session.commit();
		
		session.close();
		
		return employee;
	}

	public String generateDB() {
		SqlSession session = sqlSession();
		
		session.insert("watchman.mybatis.createEmployeeTable");
		session.commit();
		session.insert("watchman.mybatis.createManagementTable");
		session.commit();
		session.insert("watchman.mybatis.createHistoryManagementTable");
		session.commit();
		session.insert("watchman.mybatis.createVehicleTable");
		session.commit();
		session.insert("watchman.mybatis.createHistoryTable");
		session.commit();
		
		session.close();
		
		return "Success";
	}

	public MANAGEMENT_DATE getOneManagement(int mid) {
		SqlSession session = sqlSession();
		MANAGEMENT management = new MANAGEMENT();
		management.setMANAGEMENT_ID(mid);
		MANAGEMENT_DATE md = (MANAGEMENT_DATE) session.selectOne("watchman.mybatis.selectManagementDate", management);
		session.close();
		return md;
	}

	public Object getAllHistory(HttpServletRequest request, Model model, String date_visit) {
		SqlSession session = sqlSession();
		PARAMETER_HISTORY parameter_history = new PARAMETER_HISTORY();
		parameter_history.setHISTORY_ID(-1);
		if(request != null) {
			String parameter = request.getParameter("HISTORY_ID");
			if(parameter != null && !parameter.equals("")) {
				parameter_history.setHISTORY_ID(Integer.parseInt(parameter));
			}
		}
		parameter_history.setDATE_VISIT("");
		if(date_visit != null && !date_visit.equals("")) {
			parameter_history.setDATE_VISIT(date_visit);
		}
		
		ArrayList<HISTORY> historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectAllHistory", parameter_history);
		session.close();
		
		if(model != null) {
			model.addAttribute("historys", historys);
		}
		return historys;
	}

	public Object getAllHistoryByVehicle(HttpServletRequest request, Model model, int vehicle_id) {
		getVehicle(request, model, vehicle_id);
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		parameter_vehicle.setVEHICLE_ID(vehicle_id);
		if(request != null) {
			String parameter = request.getParameter("vehicle_id");
			if(parameter != null && !parameter.equals("")) {
				parameter_vehicle.setVEHICLE_ID(Integer.parseInt(parameter));
			}
		}
		
		ArrayList<HISTORY> historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectAllDateVisitByVehicle", parameter_vehicle);
		session.close();
		
		if(model != null) {
			model.addAttribute("historys", historys);
		}
		
		return historys;
	}

	public Object getManagementByHistory(HttpServletRequest request, Map<String, Object> model, int vehicle_id, String date_visit) {
		SqlSession session = sqlSession();
		PARAMETER_HISTORY parameter_history = new PARAMETER_HISTORY();
		parameter_history.setDATE_VISIT(date_visit);
		parameter_history.setVEHICLE_ID(vehicle_id);
		parameter_history.setHISTORY_ID(-1);
		parameter_history.setPAGE(0);
		parameter_history.setSIZE_PAGE(1);
		
		PARAMETER_MANAGEMENT parameter_management = new PARAMETER_MANAGEMENT();
		parameter_management.setVEHICLE_ID(vehicle_id);
		parameter_management.setDATE_VISIT(date_visit);
		
		ArrayList<MANAGEMENT> managements = (ArrayList<MANAGEMENT>) session.selectList("watchman.mybatis.selectAllManagementByDateVisitVehicle", parameter_management);
		
		HISTORY history = (HISTORY) session.selectOne("watchman.mybatis.selectHistory", parameter_history);
		parameter_history.setHISTORY_ID(history.getHISTORY_ID());
		HISTORY prev_history = (HISTORY) session.selectOne("watchman.mybatis.selectPrevHistory", parameter_history);
		HISTORY next_history = (HISTORY) session.selectOne("watchman.mybatis.selectNextHistory", parameter_history);
		
		if(model != null) {
			model.put("history", history);
			model.put("prev_history", prev_history);
			model.put("next_history", next_history);
			model.put("managements", managements);
		}

		session.close();
		
		return managements;
	}

	public String regenerateDB() {
		SqlSession session = sqlSession();
		
		session.delete("watchman.mybatis.dropManagementTable");
		session.commit();
		session.delete("watchman.mybatis.dropHistoryManagementTable");
		session.commit();
		session.delete("watchman.mybatis.dropVehicleTable");
		session.commit();
		session.delete("watchman.mybatis.dropHistoryTable");
		session.commit();
		
		session.insert("watchman.mybatis.createManagementTable");
		session.commit();
		session.insert("watchman.mybatis.createHistoryManagementTable");
		session.commit();
		session.insert("watchman.mybatis.createVehicleTable");
		session.commit();
		session.insert("watchman.mybatis.createHistoryTable");
		session.commit();
		
		session.close();
		
		return "Success";
	}
	
	public String modifyDB() {
		SqlSession session = sqlSession();
		
		//session.update("watchman.mybatis.modifyEmployeeTable");
		//session.commit();
		
		session.delete("watchman.mybatis.dropEmployeeTable");
		session.commit();
		
		session.insert("watchman.mybatis.createEmployeeTable");
		session.commit();
		
		session.close();
		
		return "Success";
	}

	private void deleteHistoryByVehicle(int vehicle_id) {
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		parameter_vehicle.setVEHICLE_ID(vehicle_id);
		ArrayList<HISTORY> historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectAllHistoryByVehicle", parameter_vehicle);
		session.close();
		for(int i = 0; i < historys.size(); i++) {
			deleteHistory(null, null, historys.get(i).getHISTORY_ID());
		}
		
	}
}
