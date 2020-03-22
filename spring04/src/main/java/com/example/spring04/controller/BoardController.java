package com.example.spring04.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.spring04.modelVO.BoardVO;
import com.example.spring04.modelVO.Criteria;
import com.example.spring04.modelVO.MemberVO;
import com.example.spring04.modelVO.PageMaker;
import com.example.spring04.modelVO.ReplyVO;
import com.example.spring04.modelVO.SearchCriteria;
import com.example.spring04.service.BoardService;
import com.example.spring04.service.PageService;
import com.example.spring04.service.ReplyService;

@Controller
@RequestMapping(value="board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@Inject
	PageService pageService;
	
	@Inject
	ReplyService replyService;
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void getBoardWrite() throws Exception {
		logger.info("get board write");
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String postBoardWrite(BoardVO wrtVO, HttpSession session, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("post board write");
		
		MemberVO sessionVO = (MemberVO) session.getAttribute("member");
		String writer = sessionVO.getUserid();
		
		wrtVO.setWriter(writer);
		boardService.boardWrite(wrtVO, mpRequest);
		
		return "redirect:/board/criListSchPage";
	}
	
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void getBoardList(@RequestParam(defaultValue="1") int num, Model model) throws Exception {
		logger.info("get board listpage");
		
		//게시물 총 갯수
		int totalRowCount = boardService.listCount();
		//페이지 처리
		Map<String, Integer> map = pageService.pagingMaker(totalRowCount, num);
		//페이지 번호에 맞는 글 목록
		List<BoardVO> boardList = null;
		boardList = boardService.boardListPage(map.get("startRow"), map.get("endRow"));
		model.addAttribute("boardList", boardList);
		model.addAttribute("map", map);
		
		
		//이전 다음 버튼 처리
//		boolean prev = map.get("startPageNum") == 1 ? false : true;
//		boolean next = map.get("endPageNum") * map.get("pageNumRange") >= totalRowCount ? false : true;
//		model.addAttribute("prev", prev);
//		model.addAttribute("next", next);
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
	
	@RequestMapping(value="/listPage", method = RequestMethod.POST)
	public void postBoardSearch(@RequestParam("option") String option, @RequestParam("keyword") String keyword, @RequestParam(value="num", defaultValue="1") int atPage, Model model) throws Exception {
		logger.info("post board listpage");
		
		System.out.println(atPage);
		//페이지 번호에 맞는 글 목록
		List<BoardVO> boardList = null;
		if (option.equals("list")) {
			//게시물 총 갯수
			int totalRowCount = boardService.listCount();
			//페이지 처리
			Map<String, Integer> map = pageService.pagingMaker(totalRowCount, atPage);
			boardList = boardService.boardListPage(map.get("startRow"), map.get("endRow"));
			model.addAttribute("boardList", boardList);
			model.addAttribute("map", map);
		} else {
			//게시물 총 갯수
			int totalRowCount = boardService.boardSelCount(option, keyword);
			//페이지 처리
			Map<String, Integer> map = pageService.pagingMaker(totalRowCount, atPage);
			List<BoardVO> boardSearch = boardService.boardListSchPage(option, keyword, map.get("startRow"), map.get("endRow"));
			model.addAttribute("boardList", boardSearch);
			model.addAttribute("option", option);
			model.addAttribute("keyword", keyword);
			model.addAttribute("map", map);
		}
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void getBoardView(@RequestParam("bno") int bno, @RequestParam(value="error", defaultValue="0") int error, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get board view");
		
		if (error == 1) {
			model.addAttribute("messege", "비밀번호를 확인해주세요.");
		}
		BoardVO boardView = boardService.boardView(bno);
		List<ReplyVO> replyList = replyService.replyList(bno);
		model.addAttribute("boardView", boardView);
		model.addAttribute("replyList", replyList);
		model.addAttribute("scri", scri);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.POST)
	public String postBoardPassChk(BoardVO passChk, Model model) throws Exception {
		logger.info("post board passchk");
		
		int result =  boardService.passChk(passChk);
		
		if(result!=1) {
			int error=1;
			model.addAttribute("error", error);
			model.addAttribute("bno", passChk.getBno());
			return "redirect:/board/view";
		} else {
			model.addAttribute("seq", passChk.getBno());
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
		
		return "redirect:/board/criListSchPage";
	}
	
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String postBoardDelete(BoardVO delVO, Model model) throws Exception {
		logger.info("post board delete");
		
		int passChk = boardService.passChk(delVO);
		
		if(passChk != 1) {
			int error = 1;
			model.addAttribute("error", error);
			model.addAttribute("bno", delVO.getBno());
			return "redirect:/board/view";
		} else {
			boardService.boardDelete(delVO.getBno());
			
			return "redirect:/board/criListSchPage";
		}
	}
	
	
	@RequestMapping(value="criListPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("get board listpage");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalPost(boardService.listCount());
		model.addAttribute("pageMaker", pageMaker);
		
		List<BoardVO> ListPage = boardService.ListPage(cri);
		model.addAttribute("boardList", ListPage);
	}
	
	@RequestMapping(value="criListSchPage", method = RequestMethod.GET)
	public void listSchPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get board listschpage");
		
		List<BoardVO> boardListSch = boardService.ListSchPage(scri);
		model.addAttribute("boardSchList", boardListSch);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalPost(boardService.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
}
