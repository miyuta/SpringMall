package com.example.spring04.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring04.modelVO.BoardVO;
import com.example.spring04.modelVO.MemberVO;
import com.example.spring04.service.BoardService;
import com.example.spring04.service.PageService;

@Controller
@RequestMapping(value="board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@Inject
	PageService pageService;
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void getBoardWrite() throws Exception {
		logger.info("get board write");
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String postBoardWrite(BoardVO wrtVO, HttpSession session) throws Exception {
		logger.info("post board write");
		
		MemberVO sessionVO = (MemberVO) session.getAttribute("member");
		String writer = sessionVO.getUserid();
		System.out.println(writer);
		
		wrtVO.setWriter(writer);
		boardService.boardWrite(wrtVO);
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void getBoardList(@RequestParam(defaultValue="1") int num, Model model) throws Exception {
		logger.info("get board listPage");
		
		//게시물 총 갯수
		int totalRowCount = boardService.listCount();
		//페이지 처리
		Map<String, Integer> map = pageService.pagingMaker(totalRowCount, num);
		//이전 다음 버튼 처리
		boolean prev = map.get("startPageNum") == 1 ? false : true;
		boolean next = map.get("endPageNum") * map.get("pageNumRange") >= totalRowCount ? false : true;
		
		//페이지 번호에 맞는 글 목록
		List<BoardVO> boardList = null;
		boardList = boardService.boardListPage(map.get("startRow"), map.get("endRow"));
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("map", map);
		
		
//		int startPageNum = map.get("startPageNum");
//		int endPageNum = map.get("endPageNum");
//		int pageNumRange = map.get("pageNumRange");
//		int startRow = map.get("startRow");
//		int endRow = map.get("endRow");
//		int pageNum = map.get("pageNum");		
//		model.addAttribute("PageNum", pageNum);
//		model.addAttribute("boardList", boardService.boardList());		
		//하단 페이지 첫 번호, 끝 번호
//		model.addAttribute("startPageNum", startPageNum);
//		model.addAttribute("endPageNum", endPageNum);
		//현재 페이지
//		model.addAttribute("atPage", num);
	}
	
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public void boardSearch(@RequestParam("option") String option, @RequestParam("keyword") String keyword, Model model) throws Exception {
		
		if (option.equals("list")) {
			List<BoardVO> boardList = boardService.boardList();
			model.addAttribute("boardList", boardList);
		} else {
			List<BoardVO> boardSearch = boardService.boardSearch(option, keyword);
			model.addAttribute("boardList", boardSearch);
			model.addAttribute("option", option);
			model.addAttribute("keyword", keyword);
		}
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
		
		boardService.boardUpdate(updVO);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String postBoardDelete(BoardVO delVO, Model model) throws Exception {
		logger.info("post board delete");
		
		int passChk = boardService.passChk(delVO);
		
		if(passChk != 1) {
			int error = 1;
			model.addAttribute("error", error);
			model.addAttribute("n", delVO.getSeq());
			return "redirect:/board/view";
		} else {
			boardService.boardDelete(delVO.getSeq());
			
			return "redirect:/board/list";
		}
	}
}
