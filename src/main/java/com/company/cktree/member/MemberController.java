package com.company.cktree.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("join")
	public String joinForm() {
		return "member/joinForm";
	}
}
