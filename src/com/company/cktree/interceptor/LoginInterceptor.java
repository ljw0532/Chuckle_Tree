package com.company.cktree.interceptor;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.company.cktree.member.MemberService;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Inject
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();	
		if (session.getAttribute("session_m_id") == null) { //웹 브라우저를 다시 들어올때 (세션이 없으면)
			Cookie autoLogin = WebUtils.getCookie(request, "autoLogin");
			if (autoLogin != null) { //세션이 없는 상태에서 쿠키에 autoLogin기록이 있으면
				String sessionkey = autoLogin.getValue();
				Map<String, Object> map = memberService.checkUserWithSessionKey(sessionkey);
				if (map != null) { //자동로그인 기간이 유효하다면 자동으로 session에 정보 등록
					session.setAttribute("session_m_name", map.get("M_NAME"));
					session.setAttribute("session_m_id", map.get("M_ID"));
					session.setAttribute("session_m_no", map.get("M_NO"));
					session.setAttribute("session_m_password", map.get("M_PASSWORD"));
					session.setAttribute("session_m_image", map.get("M_IMAGE"));
				}
			}
		}
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
