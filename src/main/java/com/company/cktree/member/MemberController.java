package com.company.cktree.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
}
