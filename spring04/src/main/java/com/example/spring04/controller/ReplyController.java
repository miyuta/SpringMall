package com.example.spring04.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.spring04.modelVO.ReplyVO;
import com.example.spring04.service.ReplyService;

@Controller
@RequestMapping(value="reply/*")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String replyInsert(ReplyVO repInsert, Model model) throws Exception {
		logger.info("post reply insert");
		
		replyService.replyInsert(repInsert);
		model.addAttribute("n",repInsert.getBno());

		return "redirect:/board/view";
	}
}
