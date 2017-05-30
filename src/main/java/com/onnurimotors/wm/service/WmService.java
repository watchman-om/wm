package com.onnurimotors.wm.service;

import java.io.IOException;
import java.io.Reader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.onnurimotors.wm.model.VEHICLE;
import com.onnurimotors.wm.model.VEHICLE_HISTORY;
import com.onnurimotors.wm.model.VEHICLE_MANAGEMENT;
import com.onnurimotors.wm.model.ALERT;
import com.onnurimotors.wm.model.EMPLOYEE;
import com.onnurimotors.wm.model.HISTORY;
import com.onnurimotors.wm.model.MANAGEMENT;
import com.onnurimotors.wm.model.PARAMETER_VEHICLE;

@Service
@SuppressWarnings("unchecked")	// annotation which removes alerts generated by uncertain casting
public class WmService {
	
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
		String license = request.getParameter("license");
		int is_new_customer;
		String msg;
		Date date = new Date();
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
        
        // TODO
        // SSE
        
        // TODO
        // kakao msg
        msg = "";
        if(vehicle.getIS_NOTIFIABLE() == 1) {
        	if(is_new_customer == 0) {
        		msg = msg + "재방문 고객<br />";
        	} else {
        		msg = msg + "처음 방문한 고객<br />";
        	}
        	msg = msg + "차량번호: " + vehicle.getLICENSE() + "<br />";
            ArrayList<VEHICLE_HISTORY> result2 = (ArrayList<VEHICLE_HISTORY>) session.selectList("watchman.mybatis.selectHistoryVehicle", vehicle);
            for(int i = 0; i < result2.size(); i++) {
            	msg = msg + result2.get(i).getDATE_VISIT() + " " + result2.get(i).getTIME_VISIT() + "<br />";
            }
        }
        
        session.close();
        
        // if is_notifiable is false, return empty message
        return msg;
	}

	public void index(Model model) {
		getAlerts(model);
	}

	public void listVehicle(HttpServletRequest request, Model model) {
		getAlerts(model);
		getVehicle(request, model);
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
		HISTORY history = new HISTORY();
		history.setHISTORY_ID(-1);
		ArrayList<HISTORY> historys = (ArrayList<HISTORY>) session.selectList("watchman.mybatis.selectHistory", history);
		
		if(model != null) {
			model.addAttribute("historys", historys);
		}
		
		session.close();
		
		return historys;
	}

	public Object getVehicle(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		vehicle.setLICENSE("");
		vehicle.setVEHICLE_ID(-1);
		if(request != null) {
			String license = request.getParameter("license");
			String vehicle_id = request.getParameter("vehicle_id");
			if(license != null && !license.equals("")) {
				vehicle.setLICENSE(license);
			}
			if(vehicle_id != null && !vehicle_id.equals("")) {
				vehicle.setVEHICLE_ID(Integer.parseInt(vehicle_id));
			}
		}
		ArrayList<VEHICLE> vehicles = (ArrayList<VEHICLE>) session.selectList("watchman.mybatis.selectVehicle", vehicle);
		
		if(model != null) {
			model.addAttribute("vehicles", vehicles);
		}
		
		session.close();
		
		return vehicles;
	}

	public void dbViewer(Model model) {
		getVehicle(null, model);
	}

	public Object getEmployee(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		EMPLOYEE employee = new EMPLOYEE();
		employee.setEMPLOYEE_ID(-1);
		ArrayList<EMPLOYEE> employees = (ArrayList<EMPLOYEE>) session.selectList("watchman.mybatis.selectEmployee", employee);
		
		if(model != null) {
			model.addAttribute("employees", employees);
		}
		
		session.close();
		
		return employees;
	}

	public Object getVehicleManagement(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		VEHICLE_MANAGEMENT vehicle_management = new VEHICLE_MANAGEMENT();
		vehicle_management.setVEHICLE_ID(-1);
		vehicle_management.setMANAGEMENT_ID(-1);
		ArrayList<VEHICLE_MANAGEMENT> vehicle_managements = (ArrayList<VEHICLE_MANAGEMENT>) session.selectList("watchman.mybatis.selectVehicleManagement", vehicle_management);
		
		if(model != null) {
			model.addAttribute("vehicle_managements", vehicle_managements);
		}
		
		session.close();
		
		return vehicle_managements;
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

	public void listHistory(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		String license = request.getParameter("license");
		String fdate = request.getParameter("fdate");
		String tdate = request.getParameter("tdate");
		String flimit = request.getParameter("flimit");
		String nlimit = request.getParameter("nlimit");
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
		
		model.addAttribute("histories", vhs);
		
		session.close();
	}

	public void getManagementCondition(HttpServletRequest request, Model model) {
		if(request != null && request.getParameter("is_new") != null && request.getParameter("is_new").equals("1")) {
			return;
		}
		SqlSession session = sqlSession();
		PARAMETER_VEHICLE parameter_vehicle = new PARAMETER_VEHICLE();
		String vehicle_id = request.getParameter("vehicle_id");
		String management_id = request.getParameter("management_id");
		String flimit = request.getParameter("flimit");
		String nlimit = request.getParameter("nlimit");
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
		
		List<MANAGEMENT> managements = (ArrayList<MANAGEMENT>)session.selectList("watchman.mybatis.selectManagementOfVehicle", parameter_vehicle);
		
		System.out.println("managements size: " + managements.size());
		
		model.addAttribute("managements", managements);
		
		session.close();
	}
	
	public void listManagement(HttpServletRequest request, Model model) {
		getVehicle(request, model);
		getManagementCondition(request, model);
	}

	public Object toggleNotifiable(HttpServletRequest request) {
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

	public Object updateVehicleModel(HttpServletRequest request) {
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
	
	public Object submitManagement(HttpServletRequest request) {
		SqlSession session = sqlSession();
		MANAGEMENT management = new MANAGEMENT();
		management.setDATE_MNG(request.getParameter("DATE_MNG"));
		management.setCOMMENT(request.getParameter("COMMENT"));
		if(request.getParameter("IS_NEW").equals("1")) {
			VEHICLE_MANAGEMENT vm = new VEHICLE_MANAGEMENT();
			session.insert("watchman.mybatis.insertManagement", management);
			session.commit();
			vm.setMANAGEMENT_ID(management.getMANAGEMENT_ID());
			vm.setVEHICLE_ID(Integer.parseInt(request.getParameter("VEHICLE_ID")));
			session.insert("watchman.mybatis.insertVehicleManagement", vm);
			session.commit();
		} else {
			management.setMANAGEMENT_ID(Integer.parseInt(request.getParameter("MANAGEMENT_ID")));
			session.update("watchman.mybatis.updateManagement", management);
			session.commit();
		}
		session.close();
		
		return management;
	}

	public Object getOneVehicle(int vehicle_id) {
		SqlSession session = sqlSession();
		VEHICLE vehicle = new VEHICLE();
		vehicle.setVEHICLE_ID(vehicle_id);
		vehicle.setLICENSE("");
		vehicle = (VEHICLE) session.selectOne("watchman.mybatis.selectVehicle", vehicle);
		
		session.close();
		
		return vehicle;
	}
}
