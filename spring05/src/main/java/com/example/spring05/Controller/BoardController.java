package com.example.spring05.Controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.service.BoardService;

@Controller
@RequestMapping(value="board/*")
public class BoardController {

		private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
		
		@Inject
		BoardService boardService;
		
		@RequestMapping(value="/listPage", method = RequestMethod.GET)
		public void boardList(@RequestParam(defaultValue="1") int num, @RequestParam(defaultValue="0") int error, Model model) throws Exception {
			logger.info("get board list");
			
			List<BoardVO> boardList = boardService.boardList();
			model.addAttribute("boardList", boardList);
		}
		
		@RequestMapping(value="/write", method = RequestMethod.GET)
		public void baordWirte() throws Exception {
			logger.info("get board write");
		}
		
		@RequestMapping(value="/write", method = RequestMethod.POST)
		public String boardWrite(BoardVO insVO, Model model) throws Exception {
			logger.info("post board write");
			
			boardService.boardWrite(insVO);
			
			return "redirect:/board/listPage";
		}
		
		@RequestMapping(value="/view", method = RequestMethod.GET)
		public void boardView(@RequestParam("seq") int seq, @RequestParam(value="error", defaultValue="0") int error, Model model) throws Exception {
			logger.info("get board view");
			
			if (error == 1) {
				model.addAttribute("message", "비밀번호를 확인해주세요.");
			}
			BoardVO boardView = boardService.boardView(seq);
			model.addAttribute("boardView", boardView);
		}
		
		@RequestMapping(value="/view", method = RequestMethod.POST)
		public String boardView(BoardVO viewVO, Model model) throws Exception {
			logger.info("post board view");
			
			int passChk = boardService.passChk(viewVO);
			int seq = viewVO.getSeq();
			if (passChk != 1) {
				model.addAttribute("error", 1);
				model.addAttribute("seq", seq);
				return "redirect:/board/view";
			}
			model.addAttribute("seq", seq);
			return "redirect:/board/modify";
		}
		
		@RequestMapping(value="/modify", method = RequestMethod.GET)
		public void boardModify(@RequestParam("seq") int seq, @RequestParam(value="error", defaultValue="0") int error, Model model) throws Exception {
			logger.info("get board modify");
			
			if (error == 1) {
				model.addAttribute("message", "비밀번호를 입력해주세요.");
			}
			BoardVO boardModify = boardService.boardView(seq);
			model.addAttribute("boardModify", boardModify);
		}
		
		@RequestMapping(value="/modify", method = RequestMethod.POST)
		public String boardModify(@RequestParam("seq") int seq, @RequestParam(value="error", defaultValue="0") int error, BoardVO modVO, Model model) throws Exception {
			logger.info("post board modify");
			
			int passChk = boardService.passChk(modVO);
			
			if (passChk != 1) {
				model.addAttribute("error", 1);
				model.addAttribute("seq", seq);
				return "redirect:/board/modify";
			} else {
				boardService.boardModify(modVO);
				model.addAttribute("seq", seq);
				return "redirect:/board/view";
			}
		}
		
		@RequestMapping(value="/delete", method = RequestMethod.POST)
		public String boardDelete(@RequestParam("seq") int seq) throws Exception {
			logger.info("post board delete");
			
			boardService.boardDelete(seq);
			
			return "redirect:/board/listPage";
		}
}
