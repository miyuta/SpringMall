package com.example.spring05.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring05.model.BoardVO;
import com.example.spring05.service.BoardService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void boardList(Model model) throws Exception {
		logger.info("get board list");
		
		model.addAttribute("boardList", boardService.boardList());
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void boardWrite() throws Exception {
		logger.info("get board write");
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWrite(BoardVO wrtVO) throws Exception {
		logger.info("post board write");
		
		boardService.boardWrite(wrtVO);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void boatrdView(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("get board view");
		
		System.out.println(bno);
		model.addAttribute("boardView", boardService.boardView(bno));
	}
}
