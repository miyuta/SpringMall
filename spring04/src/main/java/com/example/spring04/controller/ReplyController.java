package com.example.spring04.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring04.modelVO.MemberVO;
import com.example.spring04.modelVO.ReplyVO;
import com.example.spring04.service.ReplyService;

@Controller
@RequestMapping(value="reply/*")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String replyInsert(ReplyVO repInsert, HttpSession session, Model model) throws Exception {
		logger.info("post reply insert");
		
		MemberVO userid = (MemberVO) session.getAttribute("member");
		
		repInsert.setRewriter(userid.getUserid());
		replyService.replyInsert(repInsert);
		model.addAttribute("bno", repInsert.getBno());
		
		return "redirect:/board/view";
	}
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public ModelAndView replyList(@RequestParam("bno") int bno, ModelAndView mav) throws Exception {
		logger.info("get reply list");
		
		List<ReplyVO> replyList = replyService.replyList(bno);
		mav.setViewName("board/replyList");
		mav.addObject("replyList", replyList);
		
		return mav;
	}
}
