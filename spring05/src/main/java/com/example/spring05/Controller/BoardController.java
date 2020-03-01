package com.example.spring05.Controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring05.ModelVO.BoardVO;
import com.example.spring05.Service.BoardService;

@Controller
@RequestMapping(value="board/*")
public class BoardController {

		private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
		
		@Inject
		BoardService boardService;
		
		@RequestMapping(value="list", method = RequestMethod.GET)
		public void boardList() throws Exception {
			logger.info("get board list");
		}
		
		@RequestMapping(value="write", method = RequestMethod.GET)
		public void baordWirte() throws Exception {
			logger.info("get board write");
		}
		
		@RequestMapping(value="write", method = RequestMethod.POST)
		public String boardWrite(BoardVO insVO, Model model) throws Exception {
			logger.info("post board write");
			
			boardService.boardWrite(insVO);
			
			return "redirect:/board/list";
		}
		
		@RequestMapping(value="view", method = RequestMethod.GET)
		public void boardView(@RequestParam("n") int seq, Model model) throws Exception {
			logger.info("get board view");
			
			BoardVO boardView = boardService.boardView(seq);
			model.addAttribute("boardView", boardView);
		}
		
		@RequestMapping(value="modify", method = RequestMethod.GET)
		public void boardModify(@RequestParam("n") int seq, Model model) throws Exception {
			logger.info("get board modify");
			
			BoardVO boardModify = boardService.boardView(seq);
			model.addAttribute("boardModify", boardModify);
		}
		
		@RequestMapping(value="modify", method = RequestMethod.POST)
		public String boardModify(BoardVO modVO) throws Exception {
			logger.info("post board modify");
			
			boardService.boardModify(modVO);
			
			return "redirect:/board/view";
		}
		
		@RequestMapping(value="delete", method = RequestMethod.POST)
		public String boardDelete(@RequestParam("n") int seq) throws Exception {
			logger.info("post board delete");
			
			boardService.boardDelete(seq);
			
			return "redirect:/board/list";
		}
}
