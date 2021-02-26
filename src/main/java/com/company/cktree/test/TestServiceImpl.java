package com.company.cktree.test;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {
	
	@Inject
	private TestDAO testDao;
	
	@Override
	public List<TestDTO> listTest() {
		return testDao.listTest();
	}

}
