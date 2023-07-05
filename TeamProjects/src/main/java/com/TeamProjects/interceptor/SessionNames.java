package com.TeamProjects.interceptor;

public interface SessionNames {

	static final String LOGIN = "loginId";
//	static final String LOGIN_COOKIE = "loginCookie";
//	static final String ATTEMPTED = "attemptedLocation";
	
	static final int EXPIRE = 7 * 24 * 60 * 60;
}

//세션 아이디가 존재하지 않으면 사이트에 접속할 수 없도록 만들수도 있고
//전역에서 interceptor 를 통과하기때문에 여기에 세션을 저장하고 매개변수로 받지않고 사용하기 위해서