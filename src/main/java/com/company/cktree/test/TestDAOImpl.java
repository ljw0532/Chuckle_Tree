package com.company.cktree.test;

import java.util.List;
import javax.inject.Inject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("TestDAO")
public class TestDAOImpl implements TestDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TestDTO> listTest() {
		return sqlSession.selectList("test.listTest");
	}
	
}
