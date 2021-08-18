package com.company.cktree.authentications;

import java.util.Map;

public interface AuthenDAO {
	//인증코드 삽입
	public void insertAuthenCode(Map<String,Object> map);
	// 등록된 인증 코드가 있는지 가져오기 
	public AuthenDTO selectAuthenCode(String authen_code);
	// 인증이 완료되면 사용할 인증고유번호 조회
	public Map<String,Object> selectAuthenNo(int authen_no);
	// 인증 완료시 완료된 시간 업데이트 
	public void updateComDate(int authen_no);
	// 인증 완료시 인증에 여러번 사용한 이메일 삭제  
	public void deleteAuthen();
	// 회원가입완료시 인증테이블에 이메일,이름 기록 삭제
	public void deleteEmailName(int authen_no);
}
