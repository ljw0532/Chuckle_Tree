package com.company.cktree.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("joinForm")
	public String joingForm() {
		return "member/joinForm";
	}

}
