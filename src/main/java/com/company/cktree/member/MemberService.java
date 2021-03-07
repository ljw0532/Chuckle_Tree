package com.company.cktree.member;

import javax.servlet.http.HttpSession;

public interface MemberService {
	void insertMember(MemberDTO member);
	MemberDTO loginCheck(MemberDTO member, HttpSession session);
}
