package com.company.cktree.member;

public interface MemberDAO {
	void insertMember(MemberDTO member);
	
	MemberDTO loginCheck(MemberDTO member);
	
}
