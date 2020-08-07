package com.mh.naver.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class MyAspect {
	
	@Pointcut("execution(public * com..*(..))")
	public void targetMethod() {}
	
	@Around(value = "targetMethod")
	public Object measure(ProceedingJoinPoint joinPoing) throws Throwable{
		try {
			System.out.println("객체 생성화..");
			Object result = joinPoing.proceed();
			return result;
		}
		finally {
			System.out.println("여기는 무조건 온다..");
		
		}
	}
}
