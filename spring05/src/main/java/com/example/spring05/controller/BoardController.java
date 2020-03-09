package com.example.spring05.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.PageSchMaker;
import com.example.spring05.service.BoardService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private PageSchMaker PageSchMaker;
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void boardWrite() throws Exception {
		logger.info("get board write");
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWrite(BoardVO insVO) throws Exception {
		logger.info("post board write");
		
		System.out.println(insVO);
		boardService.boardWrite(insVO);
		
		return "redirect:board/list";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void boardList(Model model) throws Exception {
		logger.info("get board list");
		
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
	}
	
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void boardListPage(@RequestParam(value="atPage", defaultValue="1") int atPage, Model model) throws Exception {
		logger.info("get board listpage");
		
		int totalPost = boardService.countAll();
		Map <String, Integer> map = PageSchMaker.pagiNation(atPage, totalPost);
		
		List<BoardVO> boardListPage = boardService.boardListPage(map.get("startPost"), map.get("endPost"));
		model.addAttribute("pagiNation", map);
		model.addAttribute("boardListPage", boardListPage);
	}
	
	@RequestMapping(value="view", method = RequestMethod.GET)
	public void boardView(@RequestParam("bno") int bno, @RequestParam(value="error", defaultValue="0") int error, Model model) throws Exception {
		logger.info("get board view");
		
		if (error != 0) {
			model.addAttribute("message", "Check the Password.");
		}
		BoardVO boardView = boardService.boardView(bno);
		model.addAttribute("boardView", boardView);
	}
	
	@RequestMapping(value="view", method = RequestMethod.POST)
	public String boardView(BoardVO modVO, Model model) throws Exception {
		logger.info("post board modify");
		
		int passChk = boardService.passChk(modVO);
		model.addAttribute("bno", modVO.getBno());
		
		if (passChk != 1) {
			model.addAttribute("error", 1);
			return "redirect:/board/view";
		} else {
			return "redirect:/board/modify";
		}
	}
	
	@RequestMapping(value="modify", method = RequestMethod.GET)
	public void boardModify(@RequestParam(value="error", defaultValue="0") int error, @RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("get board modify");
		
		if (error != 0) {
			model.addAttribute("message", "Check the Password.");
		}
		BoardVO boardModify = boardService.boardView(bno);
		model.addAttribute("boardModify", boardModify);
	}
	
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String boardModify(BoardVO modVO, Model model) throws Exception {
		logger.info("post board modify");
		
		int passChk = boardService.passChk(modVO);
		model.addAttribute("bno", modVO.getBno());
		
		if (passChk != 1) {
			model.addAttribute("error", 1);
			return "redirect:/board/modify";
		} else {
			System.out.println(111);
			boardService.boardModify(modVO);
			return "redirect:/board/view";
		}
	}
	
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String boardDelete(BoardVO delVO, Model model) throws Exception {
		
		int passChk = boardService.passChk(delVO);
		
		if (passChk != 1) {
			model.addAttribute("error", 1);
			model.addAttribute("bno", delVO.getBno());
			return "redirect:/board/view";
		} else {
			boardService.boardDelete(delVO.getBno());
			return "redirect:/board/list";
		}
	}
}
