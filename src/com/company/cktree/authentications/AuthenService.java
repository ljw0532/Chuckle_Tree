package com.company.cktree.authentications;

import com.company.cktree.member.MemberDTO;

public interface AuthenService {
	
	//인증코드 DB에 삽입
	public void sendSMS(MemberDTO member);
	//인증코드 맞는지 확인
	public AuthenDTO checkAuthenCode(String authen_code);
}
