package com.company.cktree.authentications;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("AuthenDAO")
public class AuthenDAOImpl implements AuthenDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertAuthenCode(Map<String, Object> map) {
		sqlSession.insert("authen.insertAuthenCode",map);
	}

	@Override
	public AuthenDTO selectAuthenCode(String authen_code) {
		return sqlSession.selectOne("authen.selectAuthenCode", authen_code);
	}

	@Override
	public Map<String,Object> selectAuthenNo(int authen_no) {
		return sqlSession.selectOne("authen.selectAuthenNo", authen_no );
	}

	@Override
	public void updateComDate(int authen_no) {
		sqlSession.update("authen.updateComDate", authen_no);
		
	}

	@Override
	public void deleteAuthen() {
		sqlSession.delete("authen.deleteAuthen");
	}

	@Override
	public void deleteEmailName(int authen_no) {
		sqlSession.delete("authen.deleteEmailName", authen_no);
		
	}

}
