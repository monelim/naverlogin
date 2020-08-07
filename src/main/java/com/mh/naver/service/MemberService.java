package com.mh.naver.service;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements InitializingBean, DisposableBean {

	@Override
	public void destroy() throws Exception {
		System.out.println("객체 스프링 컨테이너에서 소멸");
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("객체 스프링 컨테이너에서 생성");
	}

}
