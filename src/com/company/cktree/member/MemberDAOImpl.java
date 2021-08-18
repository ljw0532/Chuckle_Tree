package com.company.cktree.member;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.cktree.board.BoardDTO;
import com.company.cktree.comments.CommentsDTO;

@Repository("MemberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertMember(MemberDTO member) {
		sqlSession.insert("member.insertMember",member);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO member) {
		return sqlSession.selectOne("member.loginCheck", member);
	}

	@Override
	public void keepLogin(String m_id,String session_id, Date session_limit) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("session_id", session_id);
		map.put("session_limit", session_limit);
		sqlSession.update("member.keepLogin",map);
	}

	@Override
	public Map<String, Object> checkUserWithSessionKey(String session_id){
		return (Map<String, Object>) sqlSession.selectOne("member.checkUserWithSessionKey",session_id) ;
	}

	@Override
	public MemberDTO findId(MemberDTO member) {
		return sqlSession.selectOne("member.findId",member);
	}

	@Override
	public MemberDTO findPw(MemberDTO member) {
		return sqlSession.selectOne("member.findPw", member);
	}

	@Override
	public int checkId(String id) {
		return sqlSession.selectOne("member.checkId", id);
	}

	@Override
	public int checkEmail(String email) {
		return sqlSession.selectOne("member.checkEmail", email);
	}

	@Override
	public MemberDTO memberInfo(int m_no) {
		return sqlSession.selectOne("member.memberInfo", m_no);
	}

	@Override
	public void memberModify(MemberDTO member) {
		sqlSession.update("member.memberModify", member);
		
	}

	@Override
	public void leaveId(int m_no) {
		sqlSession.delete("member.leaveId", m_no);
		
	}

	@Override
	public MemberDTO loginIdCheck(String m_id) {
		return sqlSession.selectOne("member.loginIdCheck",m_id);
	}

	@Override
	public String usingEmail(MemberDTO member) {
		return sqlSession.selectOne("member.usingEmail", member);
	}

	@Override
	public List<BoardDTO> myPosts(int m_no, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_no",m_no);
		map.put("end", end);
		return sqlSession.selectList("member.myPosts", map);
	}

	@Override
	public List<CommentsDTO> myComments(int m_no, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_no",m_no);
		map.put("end", end);
		return sqlSession.selectList("member.myComments",map);
	}

	@Override
	public List<BoardDTO> myLikeit(int m_no, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_no",m_no);
		map.put("end", end);
		return sqlSession.selectList("member.myLikeit", map);
	}

	@Override
	public String selectMyProfileImage(int m_no) {
		return sqlSession.selectOne("member.selectMyProfileImage", m_no);
	}

	@Override
	public void pwChange(int m_no, String m_password) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_no", m_no);
		map.put("m_password", m_password);
		sqlSession.update("member.pwChange", map);
		
	}

	@Override
	public String checkMyPw(int m_no, String m_password) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_no", m_no);
		map.put("m_password", m_password);
		return sqlSession.selectOne("member.checkMyPw", map);
	}

	@Override
	public MemberDTO selectUserInfo(int m_no) {
		return sqlSession.selectOne("member.selectUserInfo", m_no);
	}

	@Override
	public MemberDTO selectNoId(int m_no) {
		return sqlSession.selectOne("member.selectNoId", m_no);
	}

	@Override
	public String inactiveMemberCheck(int m_no) {
		return sqlSession.selectOne("inactiveMemberCheck",m_no);
	}

	@Override
	public String checkPhone(String m_phone) {
		return sqlSession.selectOne("member.checkPhone", m_phone);
	}



	
}
