package com.company.cktree.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("joinForm")
	public String joingForm() {
		return "member/joinForm";
	}
	
	//가입하기
	@RequestMapping(value="joinForm", method= RequestMethod.POST)
	public String join(MemberDTO member) {
		memberService.insertMember(member);		
		return "redirect:loginForm";
	}
	
	@RequestMapping(value="loginForm", method=RequestMethod.POST)
	public ModelAndView login(MemberDTO member, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO m_dto = memberService.loginCheck(member, session);
		if(m_dto != null) {
			mav.addObject("msg","success");
			mav.addObject("member",m_dto);
			mav.setViewName("main");
		}else {
			mav.addObject("msg","fail");
			mav.setViewName("redirect:loginForm");
		}
		return mav; 
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
	return "redirect:/";
	}
	
}
