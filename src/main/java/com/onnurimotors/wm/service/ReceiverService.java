package com.onnurimotors.wm.service;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import com.onnurimotors.wm.model.EMPLOYEE;

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
		
		ArrayList<EMPLOYEE> emps = (ArrayList<EMPLOYEE>)session.selectList("watchman.mybatis.selectEmployeeByPid", emp);
		if(emps.size() == 0) {
			session.insert("watchman.mybatis.insertEmployee", emp);
		} else {
			EMPLOYEE emp2 = emps.get(0);
			emp2.setPHONE_NUMBER(emp.getPHONE_NUMBER());
			emp2.setKAKAO_ACCOUNT(emp.getKAKAO_ACCOUNT());
			session.update("watchman.mybatis.updateEmployee", emp2);
		}
		session.commit();
		
		session.close();
		
		return;
	}

	public List<EMPLOYEE> getEmployee(HttpServletRequest request, Map<String, Object> model, int empId) {
		SqlSession session = sqlSession();
		EMPLOYEE employee = new EMPLOYEE();
		employee.setEMPLOYEE_ID(empId);
		List<EMPLOYEE> employees = (ArrayList<EMPLOYEE>) session.selectList("watchman.mybatis.selectEmployee", employee);
		
		if(model != null) {
			model.put("employees", employees);
		}
		
		session.close();
		
		return employees;
	}

	public void insertEmployee(EMPLOYEE emp) {
		SqlSession session = sqlSession();
		session.insert("watchman.mybatis.insertEmployee", emp);
		session.commit();
		session.close();
	}

	public void updateEmployee(EMPLOYEE emp) {
		SqlSession session = sqlSession();
		session.update("watchman.mybatis.updateEmployee", emp);
		session.commit();
		session.close();
	}

	public void deleteEmployee(int empId) {
		SqlSession session = sqlSession();
		EMPLOYEE emp = new EMPLOYEE();
		emp.setEMPLOYEE_ID(empId);
		session.delete("watchman.mybatis.deleteEmployee", emp);
		session.commit();
		session.close();
	}

}
