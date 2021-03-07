package com.company.cktree.member;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
