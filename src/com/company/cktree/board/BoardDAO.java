package com.company.cktree.board;

import java.util.List;
import java.util.Map;

import com.company.cktree.comments.CommentsDTO;

public interface BoardDAO {
	//fun게시판리스트
	public List<BoardDTO> funBoardList(String searchOption, String keyword,int start, int end);
	//페이지리스트
	public int pagingList(Map<String,Object> map);
	//게시글 쓰기
	public void boardWrite(BoardDTO board);
	//게시글 상세
	public Map<String,Object> funBoardDetail(int b_no);
	//게시글 수정
	public void boardUpdate(BoardDTO board);
	//게시글 삭제
	public void boardDelete(int b_no);
	//조회수
	public void detailCnt(int b_no);
	//베스트 게시물 리스트
	public List<BoardDTO> bestBoardList(String searchOption, String keyword, int start, int end);
	//베스트 게시물 리스트 갯수
	public int countBestBoardList(Map<String,Object> map);
	//워스트 게시물 리스트
	public List<BoardDTO> worstBoardList(String searchOption, String keyword, int start, int end);
	//워스트 게시물 리스트 갯수
	public int countWorstBoardList(Map<String,Object> map);
	
	//좋아요 insert
	public void insertLikeit(Map<String, Object> map);
	//좋아요 확인
	public Map<String,Object> selectLikeitExist(Map<String,Object> map);
	//좋아요 취소
	public void deleteLikeit(Map<String,Object> map);
	//좋아요 갯수	
	public int countLikeit(int b_no);
	
	//싫어요 insert
	public void insertDislike(Map<String,Object>map);
	//싫어요 눌렀는지 확인
	public Map<String,Object> selectDislikeExist(Map<String,Object>map);
	//싫어요 취소
	public void deleteDislike(Map<String,Object> map);
	//싫어요 갯수
	public int countDislike(int b_no);
	
	//댓글 작성
	public void writeComments(Map<String,Object> map);
	//댓글 리스트
	public List<CommentsDTO> commentsList(Map<String,Object> map);
	//댓글&답글 수정
	public void commentsUpdate(Map<String,Object> map);
	//댓글&답글 삭제
	public void commentsDelete(Map<String,Object> map);
	//댓글 갯수
	public int countComments(int b_no);
	
}
