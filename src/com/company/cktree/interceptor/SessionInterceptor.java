package com.company.cktree.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.company.cktree.member.MemberService;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	@Inject
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response , Object handler)
			throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("session_m_no") == null) { //세션 정보가 없으면
			response.sendRedirect(request.getContextPath()+"/loginForm");
			return false;
		}
		return true;
	}
}
