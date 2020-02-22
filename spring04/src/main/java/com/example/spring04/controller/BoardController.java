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
	
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void getBoardList(@RequestParam("num") int num, Model model) throws Exception {
		logger.info("get board listPage");
		
		//게시물 총 갯수
		int totalRowCount = boardService.listCount();
		
		//한 페이지에 출력 할 게시물 갯수
		int perPageRow = 10;
		
		//현재 페이지
		int atPage = num;
		
		//하단 페이지 번호 (게시물 총 갯수 / 한 페이지에 출력 할 게수물 갯수)의 올림 ex 100 / 10 = 10  1번 페이지부터 10번 페이지까지
		int pageNum = (int)Math.ceil((double)totalRowCount/perPageRow);
		
		//출력 할 게시물 첫 번호
		int startRow = (num - 1) * perPageRow + 1;
		
		//출력 할 게시물 끝 번호
		int endRow = atPage * perPageRow;
		
		//한번에 표시할 페이지 번호 수
		int pageNumRange = 10;
		
		//표시되는 마지막 페이지 번호(10단위로 끊김 게시물 갯수에 따라 마지막 번호가 남음)
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNumRange) * pageNumRange);
		
		//표시되는 페이지 처음 번호
		int startPageNum = endPageNum - (pageNumRange - 1);
		
		//표시되는 마지막 페이지 번호 비교(1단위로 끊김)
		int endPageNum_tmp = (int)Math.ceil((double)totalRowCount/(double)pageNumRange);
		
		//10단위가 1단위보다 크면 1단위를 표시
		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNumRange >= totalRowCount ? false : true;
		
		List<BoardVO> boardList = null;
		boardList = boardService.boardListPage(startRow, endRow);
		model.addAttribute("boardList", boardList);
		model.addAttribute("PageNum", pageNum);
		//model.addAttribute("boardList", boardService.boardList());
		
		//하단 페이지 첫 번호, 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		//이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		//현재 페이지
		model.addAttribute("atPage", atPage);
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
