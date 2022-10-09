package com.bs.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {

	// 게시글 조회(화면)
	@GetMapping("list")
	public String list(Model model) {

		model.addAttribute("title", "BOARD");
		model.addAttribute("page", "board/board-list");

		return "layout/template";

	}//list
	
}//class
