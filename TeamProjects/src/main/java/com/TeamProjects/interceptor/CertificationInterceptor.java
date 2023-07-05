package com.TeamProjects.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.MemberDTO;

@Component
public class CertificationInterceptor implements HandlerInterceptor,SessionNames {
 
    @Override //클라이언트의 요청을 컨트롤러에 전달하기 전에 호출
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        MemberDTO loginDTO = (MemberDTO) session.getAttribute("loginId");
        
		/*
		 * if(loginDTO ==null) { response.sendRedirect(); return false; }
		 */
        
        //세션값을 가지고 와서 SessionNames에 저장을 해준다.
        //interceptor에 저장된 세션값을 웹소켓에서 불러와서 사용하기 위함
        String loginId = (String)session.getAttribute("loginId");
        session.setAttribute(LOGIN, loginId);
	
        return true;
    }
 
    @Override //클라이언트의 요청을 처리한 뒤에 호출
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        
    }
 
    @Override //클라이언트 요청을 마치고 클라이언트에서 뷰를 통해 응답을 전송한 뒤 실행
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
        
    }
 
}