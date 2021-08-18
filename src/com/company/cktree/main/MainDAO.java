package com.company.cktree.main;

import java.util.List;

import com.company.cktree.board.BoardDTO;

public interface MainDAO {
	List<BoardDTO> mainBestBoardList();
	List<BoardDTO> mainFunBoardList();
	List<BoardDTO> mainWorstBoardList();
}
