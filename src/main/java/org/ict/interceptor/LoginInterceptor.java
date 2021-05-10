package org.ict.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
							Object handler, ModelAndView modelandview) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelmap = modelandview.getModelMap();
		Object membervo = modelmap.get("membervo");
		
		if(membervo != null) {
			log.info("로그인 성공");
			session.setAttribute(LOGIN, membervo);
			response.sendRedirect("/crescent");
		}//if
	}//postHandle
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			log.info("이전 로그인 데이터 삭제");
			
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
}
