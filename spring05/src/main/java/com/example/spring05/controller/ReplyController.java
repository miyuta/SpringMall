package com.example.spring05.controller;

import java.util.List;

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
		List<ReplyVO> reply = replyService.replyList(bno);
		mav.addObject("replyList", replyService.replyList(bno));
		System.out.println(reply);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String replyWrite(@RequestBody ReplyVO rewrtVO, HttpSession session, Model model) throws Exception {
		logger.info("post reply write");
		
		replyService.replyWrite(rewrtVO);
		model.addAttribute("bno", rewrtVO.getBno());
		
		return "redirect:/board/view";
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String replyDelete(@RequestBody ReplyVO redelVO, Model model) throws Exception {
		logger.info("post reply delete");
		
		replyService.replyDelete(redelVO);
		model.addAttribute("bno", redelVO.getBno());
		
		return "redirect:/board/view";
	}
}
