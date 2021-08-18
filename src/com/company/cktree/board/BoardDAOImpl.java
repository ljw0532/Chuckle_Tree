package com.company.cktree.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.cktree.comments.CommentsDTO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSessionTemplate sqlSession;
	
	//fun게시판리스트
	@Override
	public List<BoardDTO> funBoardList(String searchOption,String keyword,int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.funBoardList",map);
	}

	@Override
	public void boardWrite(BoardDTO board) {
		sqlSession.insert("board.boardWrite", board);
	}

	@Override
	public int pagingList(Map<String,Object> map) {
		return sqlSession.selectOne("board.pagingList",map);
	}

	@Override
	public Map<String, Object> funBoardDetail(int b_no) {
		return sqlSession.selectOne("board.funBoardDetail", b_no);
	}

	@Override
	public void detailCnt(int b_no) {
		sqlSession.update("board.detailCnt", b_no);
		
	}

	@Override
	public void insertLikeit(Map<String, Object> map) {
		sqlSession.insert("board.insertLikeit", map);
		
	}

	@Override
	public Map<String, Object> selectLikeitExist(Map<String, Object> map) {
		
		return sqlSession.selectOne("board.selectLikeitExist", map);
	}

	@Override
	public void deleteLikeit(Map<String, Object> map) {
		sqlSession.delete("board.deleteLikeit",map);
		
	}

	@Override
	public int countLikeit(int b_no) {
		return sqlSession.selectOne("board.countLikeit",b_no);
	}

	@Override
	public void insertDislike(Map<String, Object> map) {
		sqlSession.selectOne("board.insertDislike", map);
		
	}

	@Override
	public Map<String, Object> selectDislikeExist(Map<String, Object> map) {	
		return sqlSession.selectOne("board.selectDislikeExist", map);
	}

	@Override
	public void deleteDislike(Map<String, Object> map) {
		sqlSession.delete("board.deleteDislike", map);
		
	}

	@Override
	public int countDislike(int b_no) {
		return sqlSession.selectOne("board.countDislike", b_no);
	}

	@Override
	public void writeComments(Map<String, Object> map) {
		sqlSession.insert("board.writeComments", map);
		
	}

	@Override
	public List<CommentsDTO> commentsList(Map<String, Object> map) {
		return (List)sqlSession.selectList("board.commentsList", map);
	}

	@Override
	public void commentsUpdate(Map<String, Object> map) {
		sqlSession.update("board.commentsUpdate",map);
		
	}

	@Override
	public void commentsDelete(Map<String, Object> map) {
		sqlSession.delete("board.commentsDelete", map);		
	}
	@Override
	public int countComments(int b_no) {
		return sqlSession.selectOne("board.countComments",b_no);
	}

	@Override
	public void boardUpdate(BoardDTO board) {
		sqlSession.update("board.boardUpdate", board);
		
	}

	@Override
	public void boardDelete(int b_no) {
		sqlSession.delete("board.boardDelete", b_no);		
	}

	@Override
	public List<BoardDTO> bestBoardList(String searchOption, String keyword, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.bestBoardList", map);
	}

	@Override
	public int countBestBoardList(Map<String, Object> map) {
		return sqlSession.selectOne("board.countBestBoardList", map);
	}

	@Override
	public List<BoardDTO> worstBoardList(String searchOption, String keyword, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.worstBoardList", map);
	}

	@Override
	public int countWorstBoardList(Map<String, Object> map) {
		return sqlSession.selectOne("board.countWorstBoardList", map);
	}

	
}
