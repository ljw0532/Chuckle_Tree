package com.company.cktree.main;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.cktree.board.BoardDAO;

@Controller
public class MainController {

	@Inject
	MainDAO mainDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("bestList", mainDAO.mainBestBoardList());
		model.addAttribute("funList", mainDAO.mainFunBoardList());
		model.addAttribute("worstList", mainDAO.mainWorstBoardList());
		return "main";
	}
	

	
}
