package com.onnurimotors.wm.controller;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WmRestController {

	@RequestMapping(value="/helloworld", method = RequestMethod.GET)
	public String Helloworld() {
		return "Hello World";
	}

    @RequestMapping("/sqltest")
    @ResponseBody
	List<Map<String, Object>> home() {
        String resource = "mybatis-config.xml";
        try (Reader in = Resources.getResourceAsReader(resource)) {
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);

            SqlSession session = factory.openSession();
            List<Map<String, Object>> result = session.selectList("watchman.mybatis.selectTest");
            return result;
        } catch (IOException e) {
        }

        return null;
    }
}
