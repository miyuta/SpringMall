package com.example.spring05.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring05.dao.PageMaker;
import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.service.BoardService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value="/passChk", method=RequestMethod.POST)
	public  boolean passChk(@RequestBody BoardVO passChk) throws Exception {
		logger.info("post board passchk");
		
		boolean result=false;
		System.out.println(passChk.getPasswd());
		
		String passwd = boardService.passChk(passChk.getBno());
		System.out.println(passwd);
		if (passChk.getPasswd().equals(passwd)) {
			result=true;
		} 
		return result;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void boardList(Model model) throws Exception {
		logger.info("get board list");
		
		model.addAttribute("boardList", boardService.boardList());
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void boardListPage(Model model, PaginationVO pageVO) throws Exception {
		logger.info("get board listPage");
		
		System.out.println(pageVO.getStartPost());
		System.out.println(pageVO.getEndPost());
		
		model.addAttribute("boardListPage", boardService.boardListPage(pageVO));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageVO(pageVO);
		pageMaker.setTotalPost(boardService.countAll());
		model.addAttribute("pageMaker", pageMaker);
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
		
		model.addAttribute("boardView", boardService.boardView(bno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void boardModify(@RequestParam("bno") int bno, HttpSession session, Model model) throws Exception {
		logger.info("get board modify");
		
		model.addAttribute("boardModify", boardService.boardView(bno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String boardModify(BoardVO modVO) throws Exception {
		logger.info("post board modify");
		
		boardService.boardModify(modVO);
		
		return "redirect:/board/view?bno="+modVO.getBno();
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void boardDelete(@RequestBody int bno) throws Exception {
		logger.info("post board delete");
		
		System.out.println(bno);
		boardService.boardDelete(bno);
	}
}
