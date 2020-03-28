package com.example.spring05.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
}
