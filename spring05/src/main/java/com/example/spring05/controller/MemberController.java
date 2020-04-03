package com.example.spring05.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring05.model.MemberVO;
import com.example.spring05.service.MemberService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	@ResponseBody
	@RequestMapping(value="/passChk", method=RequestMethod.POST)
	public boolean memberChk(@RequestBody MemberVO passChk) throws Exception {
		logger.info("post member passchk");
		
		boolean result = true;
		
		String passwd = memberService.passChk(passChk.getUserid());
		if  (passwd != null) {
			result = true;
		}
		System.out.println(result);
		return result;
	}
	
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
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void memberView(@RequestParam("userid")  String userid, Model model) throws Exception {
		logger.info("get member view");
		
		model.addAttribute("memberView", memberService.memberView(userid));
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void memebrModify(String userid, Model model) throws Exception {
		logger.info("get member modify");
		
		model.addAttribute("memberModify", memberService.memberView(userid));
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String memberModify(MemberVO memModVO) throws Exception {
		logger.info("post member modify");
		
		memberService.memberModify(memModVO);
		
		return "redirect:/member/view?=" + memModVO.getUserid();
	}
}
