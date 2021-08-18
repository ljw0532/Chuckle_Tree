package com.company.cktree.main;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.cktree.board.BoardDTO;

@Repository("MainDAO")
public class MainDAOImpl implements MainDAO {
	@Inject
	SqlSession sqlSession;
	@Override
	public List<BoardDTO> mainBestBoardList() {
		return sqlSession.selectList("board.mainBestBoardList");
	}

	@Override
	public List<BoardDTO> mainFunBoardList() {
		return sqlSession.selectList("board.mainFunBoardList");
	}

	@Override
	public List<BoardDTO> mainWorstBoardList() {
		return sqlSession.selectList("board.mainWorstBoardList");
	}

}
