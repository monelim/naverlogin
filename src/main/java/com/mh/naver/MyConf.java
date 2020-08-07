package com.mh.naver;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
@EnableAspectJAutoProxy
public class MyConf {
	
	@Bean
	public DataSource datasource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://127.0.0.1/spring5fs?characterEncoding=utf8&serverTimezone=UTC&useUnicode=true");
		ds.setUsername("root");
		ds.setPassword("1234");
//		ds.setMaxActive(10);
		return ds;
	}
	
	@Bean
	public  JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(datasource());
	}

}
