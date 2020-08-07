package com.mh.naver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
	
	@Autowired
	JdbcTemplate jt;
	
	@GetMapping("/myjson")
	public String myjson() {
		int rowcnt = jt.queryForObject(
				"select count(*) from member where email = ? ",
				Integer.class,
				"aaa@naver.com");
		return "rowcnt = " + rowcnt;
	}

}
