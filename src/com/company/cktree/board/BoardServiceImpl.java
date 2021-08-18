package com.company.cktree.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.company.cktree.comments.CommentsDTO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> funBoardList(String searchOption, String keyword, int start, int end) {
		return boardDAO.funBoardList(searchOption,keyword, start, end);
	}

	@Override
	public void boardWrite(BoardDTO board) {
		boardDAO.boardWrite(board);
	}

	@Override
	public int pagingList(String searchOption, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchOption",searchOption);
		map.put("keyword", keyword);
		return boardDAO.pagingList(map);
	}

	@Override
	public Map<String,Object> funBoardDetail(Map<String, Object> map) {
		int b_no = (int) map.get("b_no");
		Map<String,Object> result = new HashMap<>();
		Map<String,Object> detail = boardDAO.funBoardDetail(b_no);
		int countLikeit = boardDAO.countLikeit(b_no);
		int countDislike = boardDAO.countDislike(b_no);
		int countCmt = boardDAO.countComments(b_no);
		if (map.get("m_no") != null && !StringUtils.isEmpty(map.get("m_no").toString())) {
			Map<String, Object> likeExist = boardDAO.selectLikeitExist(map);
			Map<String, Object> dislikeExist = boardDAO.selectDislikeExist(map);
			//ÁÁ¾Æ¿ä
			if (likeExist != null) {
				result.put("likeit", likeExist.get("L_NO"));
			} else {
				result.put("likeit", null);
			} 
			//½È¾î¿ä
			if(dislikeExist != null) {
				result.put("dislike", dislikeExist.get("DL_NO"));
			} else {
				result.put("dislike", null);
			}	
		} else {
			result.put("likeit", null);
			result.put("dislike", null);
		}
		result.put("detail", detail);
		result.put("countCmt", countCmt);
		result.put("countDislike",countDislike);
		result.put("countLikeit", countLikeit);
		return result;
	}

	@Override
	public void detailCnt(int b_no) {
		boardDAO.detailCnt(b_no);	
	}

	@Override
	public int insertLikeit(Map<String, Object> map) {
		Map<String,Object> likeResult = new HashMap<>();
		likeResult = boardDAO.selectLikeitExist(map);
		if(likeResult == null) {
		boardDAO.insertLikeit(map);
			return 1;
		} else {
			boardDAO.deleteLikeit(map);
			return 0;
		}
	}
	@Override
	public int deleteDislike(Map<String,Object> map) {
		boardDAO.deleteDislike(map);	
		return 1;
	}
	
	@Override
	public int deleteLikeit(Map<String,Object> map) {
		boardDAO.deleteLikeit(map);
		return 1;
	}
	@Override
	public int countLikeit(int b_no) {		
		return boardDAO.countLikeit(b_no);
	}

	@Override
	public int insertDislike(Map<String, Object> map) {
		Map<String,Object> disLikeResult = new HashMap<>();
		disLikeResult = boardDAO.selectDislikeExist(map);
			if(disLikeResult == null) {
			boardDAO.insertDislike(map);
			return 1; 
		} else {
			boardDAO.deleteDislike(map);
			return 0;		
		}
	}

	@Override
	public int countDislike(int b_no) {
		return boardDAO.countDislike(b_no);
	}

	@Override
	public void writeComments(Map<String, Object> map) {
		boardDAO.writeComments(map);
		
	}

	@Override
	public Map<String,Object> commentsList(Map<String, Object> map) {
		Map<String,Object> result = new HashMap<>();
		int b_no = (int) map.get("b_no");
		List<CommentsDTO> list = boardDAO.commentsList(map);
		int count = boardDAO.countComments(b_no);
		result.put("commentsList",list);
		result.put("countComments",count);
		return result;
	}
	
	@Override
	public String commentsUpdate(Map<String,Object> map) {
		 boardDAO.commentsUpdate(map);
		 return "(¼öÁ¤µÊ)";
	}

	@Override
	public void commentsDelete(Map<String, Object> map) {
		boardDAO.commentsDelete(map);		
	}

	@Override
	public void boardUpdate(BoardDTO board) {
		boardDAO.boardUpdate(board);
		
	}

	@Override
	public void boardDelete(int b_no) {
		boardDAO.boardDelete(b_no);	
	}

	@Override
	public List<BoardDTO> bestBoardList(String searchOption, String keyword, int start, int end) {
		return boardDAO.bestBoardList(searchOption, keyword, start, end);
	}

	@Override
	public int countBestBoardList(String searchOption, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchOption",searchOption);
		map.put("keyword", keyword);
		return boardDAO.countBestBoardList(map);
	}

	@Override
	public List<BoardDTO> worstBoardList(String searchOption, String keyword, int start, int end) {
		return boardDAO.worstBoardList(searchOption, keyword, start, end);
	}

	@Override
	public int countWorstBoardList(String searchOption, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchOption",searchOption);
		map.put("keyword", keyword);
		return boardDAO.countWorstBoardList(map);
	}

}
