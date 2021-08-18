package com.company.cktree.member;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberService {
	//회원가입
	public void insertMember(MemberDTO member,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//로그인 확인
	public MemberDTO loginCheck(MemberDTO member, HttpSession session);
	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepLogin(String m_id,String session_id, Date session_limit); 
	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크
    public Map<String, Object> checkUserWithSessionKey(String SESSIONKEY);
    //아이디 찾기
	public MemberDTO findId(MemberDTO member);
	//비밀번호 찾기
    public MemberDTO findPw(MemberDTO member) throws Exception;
    //아이디 확인
    public int checkId(String id);
    //이메일 확인
    public int checkEmail(String email);
    //나의 회원정보 조회
    public MemberDTO memberInfo(int m_no);
    //회원정보 수정
    public void memberModify(MemberDTO member,MultipartHttpServletRequest request);
    //회원탈퇴
    public void leaveId(int m_no); 
    //비밀번호 변경
    public int pwChange(int m_no,String org_pw, String m_password, HttpSession session);
    //회원정보 조회
    public MemberDTO selectUserInfo(int m_no);
}
