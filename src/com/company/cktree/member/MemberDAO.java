package com.company.cktree.member;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.company.cktree.board.BoardDTO;
import com.company.cktree.comments.CommentsDTO;

public interface MemberDAO {
	//회원정보 insert(회원가입)
	public void insertMember(MemberDTO member);
	//로그인 체크
	public MemberDTO loginCheck(MemberDTO member);
	//자동 로그인
	public void keepLogin(String m_id,String session_id, Date session_limit);
	//로그인 세션키 확인
	public Map<String,Object> checkUserWithSessionKey(String session_id);
	//아이디 찾기
	public MemberDTO findId(MemberDTO member);
	//비밀번호 찾기
	public MemberDTO findPw(MemberDTO member);
	//회원가입시 아이디 중복 체크
	public int checkId(String id);
	//회원가입시 이메일 중복 체크
	public int checkEmail(String email);
	//나의 회원정보 조회
	public MemberDTO memberInfo(int m_no);
	//나의 회원정보 수정
	public void memberModify(MemberDTO member);
	//회원탈퇴
	public void leaveId(int m_no);
	//로그인시 아이디 체크
	public MemberDTO loginIdCheck(String m_id);
	//현재 내가 사용중인 이메일인지 체크
	public String usingEmail(MemberDTO member);
	//회원가입시 핸드폰 중복 체크
	public String checkPhone(String m_phone);

	//내가 쓴 글
	public List<BoardDTO> myPosts(int m_no,int end);
	//내가 쓴 댓글
	public List<CommentsDTO> myComments(int m_no, int end);
	//내가 누른 좋아요
	public List<BoardDTO> myLikeit(int m_no, int end);
	
	//프로필 이미지 가져오기
	public String selectMyProfileImage(int m_no);
	//비밀번호 변경
	public void pwChange(int m_no, String m_password);
	//현재 내가 쓰고 있는 비밀번호 인지 확인
	public String checkMyPw(int m_no, String m_password);
	//회원정보 조회
	public MemberDTO selectUserInfo(int m_no);
	//다른 회원의 작성글 조회하기 위한 id,no
	public MemberDTO selectNoId(int m_no);
	
	//비활성 회원인지 체크하는 쿼리
	public String inactiveMemberCheck(int m_no);
}
