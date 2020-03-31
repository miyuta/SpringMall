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
import org.springframework.web.servlet.ModelAndView;

import com.example.spring05.model.ReplyVO;
import com.example.spring05.service.ReplyService;

@Controller
@RequestMapping(value="/reply/*")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView replyList(@RequestParam("bno") int bno, ModelAndView mav) throws Exception {
		logger.info("get reply list");
		
		mav.setViewName("board/replyList");
		mav.addObject("replyList", replyService.replyList(bno));
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String replyWrite(@RequestBody ReplyVO reWrtVO, HttpSession session, Model model) throws Exception {
		logger.info("post reply write");
		
		replyService.replyWrite(reWrtVO);
		model.addAttribute("bno", reWrtVO.getBno());
		
		return "redirect:/board/view";
	}
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public ModelAndView replyModify(ReplyVO reViewVO, ModelAndView mav) throws Exception {
		logger.info("get reply view");
		
		mav.setViewName("board/replyModify");
		mav.addObject("replyView", replyService.replyView(reViewVO));
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String replyModify(@RequestBody ReplyVO reModVO, Model model) throws Exception {
		logger.info("post reply modify");
		
		replyService.replyModify(reModVO);
		model.addAttribute("bno", reModVO.getBno());
		
		return "redirect:/board/view";
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String replyDelete(@RequestBody ReplyVO reDelVO, Model model) throws Exception {
		logger.info("post reply delete");
		
		replyService.replyDelete(reDelVO);
		model.addAttribute("bno", reDelVO.getBno());
		
		return "redirect:/board/view";
	}
}
