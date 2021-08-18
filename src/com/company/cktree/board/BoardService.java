package com.company.cktree.board;

import java.util.List;
import java.util.Map;

import com.company.cktree.comments.CommentsDTO;

public interface BoardService {
	//fun게시판리스트
	public List<BoardDTO> funBoardList(String searchOption, String keyword, int start, int end);
	//페이지 리스트
	public int pagingList(String searchOption, String keyword);
	//글쓰기
	public void boardWrite(BoardDTO board);
	//게시글 상세
	public Map<String,Object> funBoardDetail(Map<String,Object> map);
	//조회수
	public void detailCnt(int b_no);
	//좋아요 insert
	public int insertLikeit(Map<String,Object> map);
	//좋아요 Count
	public int countLikeit(int b_no);
	//좋아요시 싫어요 취소
	public int deleteDislike(Map<String,Object> map);
	//싫어요 추가
	public int insertDislike(Map<String,Object> map);
	//싫어요 갯수
	public int countDislike(int b_no);
	//싫어요시 좋아요 취소
	public int deleteLikeit(Map<String,Object> map);
	//댓글 작성
	public void writeComments(Map<String,Object> map);
	//댓글 리스트
	public Map<String,Object> commentsList(Map<String,Object> map);
	//댓글 수정
	public String commentsUpdate(Map<String,Object> map);
	//댓글 삭제
	public void commentsDelete(Map<String,Object> map);
	//게시글 수정
	public void boardUpdate(BoardDTO board);
	//게시글 삭제
	public void boardDelete(int b_no);	
	//베스트 게시판 리스트
	public List<BoardDTO> bestBoardList(String searchOption, String keyword, int start, int end);
	//베스트 게시판 리스트 갯수
	public int countBestBoardList(String searchOption, String keyword);
	//베스트 게시판 리스트
	public List<BoardDTO> worstBoardList(String searchOption, String keyword, int start, int end);
	//베스트 게시판 리스트 갯수
	public int countWorstBoardList(String searchOption, String keyword);
	
}