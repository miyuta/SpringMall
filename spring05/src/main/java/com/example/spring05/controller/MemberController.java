package com.example.spring05.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.spring05.model.MemberVO;
import com.example.spring05.service.MemberService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void memberList(Model model) throws Exception {
		logger.info("get member list");
		
		model.addAttribute("memberList", memberService.memberList());
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void memberRegister() throws Exception {
		logger.info("get member register");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String memberRegister(MemberVO memRegVO) throws Exception {
		logger.info("post member register");
		
		memberService.memberRegister(memRegVO);
		
		return "redirect:/member/list";
	}
}
