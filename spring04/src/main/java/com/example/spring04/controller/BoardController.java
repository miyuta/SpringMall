package com.example.spring04.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring04.modelVO.BoardVO;
import com.example.spring04.service.BoardService;

@Controller
@RequestMapping(value="board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void getBoardWrite() throws Exception {
		logger.info("get board write");
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String postBoardWrite(BoardVO wrtVO) throws Exception {
		logger.info("post board write");
		
		boardService.boardWrite(wrtVO);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void getBoardList(Model model) throws Exception {
		logger.info("get board list");
		
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		//model.addAttribute("boardList", boardService.boardList());
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void getBoardView(@RequestParam("n") int seq, @RequestParam("error") int error, Model model) throws Exception {
		logger.info("get baord view");
		
		if (error == 1) {
			model.addAttribute("messege", "비밀번호를 확인해주세요.");
		}
		BoardVO boardView = boardService.boardView(seq);
		model.addAttribute("boardView", boardView);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.POST)
	public String postBoardPassChk(BoardVO passChk, Model model) throws Exception {
		logger.info("post board passchk");
		
		int result =  boardService.passChk(passChk);
		
		if(result!=1) {
			int error=1;
			model.addAttribute("error", error);
			model.addAttribute("n", passChk.getSeq());
			return "redirect:/board/view";
		} else {
			model.addAttribute("seq", passChk.getSeq());
			return "redirect:/board/update";
		}
	}
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public void getBoardUpdate(@RequestParam("seq") int seq, Model model) throws Exception {
		logger.info("get board update");
		
		BoardVO boardUpdate = boardService.boardView(seq);
		model.addAttribute("boardUpdate", boardUpdate);
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String postBoardUpdate(BoardVO updVO) throws Exception {
		logger.info("post board update");
		
		System.out.println(updVO.getPasswd());
		boardService.boardUpdate(updVO);
		
		return "redirect:/board/list";
	}
}
