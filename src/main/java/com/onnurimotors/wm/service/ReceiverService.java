package com.onnurimotors.wm.service;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.onnurimotors.wm.model.EMPLOYEE;
import com.onnurimotors.wm.model.MANAGEMENT;
import com.onnurimotors.wm.model.VEHICLE_MANAGEMENT;

@Service
public class ReceiverService {
	
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
	
	public void saveReceiver(EMPLOYEE emp) {
		SqlSession session = sqlSession();
		
		session.insert("watchman.mybatis.insertEmployee", emp);
		session.commit();
		
		session.close();
		
		return;
	}

	public List<EMPLOYEE> getEmployee(HttpServletRequest request, Model model) {
		SqlSession session = sqlSession();
		EMPLOYEE employee = new EMPLOYEE();
		employee.setEMPLOYEE_ID(-1);
		List<EMPLOYEE> employees = (ArrayList<EMPLOYEE>) session.selectList("watchman.mybatis.selectEmployee", employee);
		
		if(model != null) {
			model.addAttribute("employees", employees);
		}
		
		session.close();
		
		return employees;
	}

}
