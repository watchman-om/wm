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
import com.onnurimotors.wm.model.ALERT;
import com.onnurimotors.wm.model.HISTORY;

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

	public void getAlerts(Model model) {
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
		model.addAttribute("alerts", alerts);
	}
}
