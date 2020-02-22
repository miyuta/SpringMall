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

import com.example.spring04.modelVO.MemberVO;
import com.example.spring04.service.MemberService;

@Controller
@RequestMapping(value="member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void memberRegister() throws Exception {
		logger.info("get member register");
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String memberRegister(MemberVO memReg) throws Exception {
		logger.info("post member register");
		
		memberService.memberRegister(memReg);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void memberList(Model model) throws Exception {
		logger.info("get member register");
		
		List<MemberVO> memberList = memberService.memberList();
		
		model.addAttribute("memberList", memberList);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void memberView(@RequestParam("n") int rnum, @RequestParam("error") int error, Model model) throws Exception {
		logger.info("get member view");
		
		MemberVO memberView = memberService.memberView(rnum);
		
		if (error != 0) {
			String message = memberService.message(error);
			model.addAttribute("message", message);
			model.addAttribute("memberView", memberView);
		} else {
			model.addAttribute("memberView", memberView);
		}
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void memberModify(@RequestParam("n") int rnum, @RequestParam("error") int error, Model model) throws Exception {
		logger.info("get member modify");
		
		MemberVO memberModify = memberService.memberView(rnum);
		
		if (error != 0) {
			String message = memberService.message(error);
			model.addAttribute("message", message);
			model.addAttribute("memberModify", memberModify);
		} else {
			model.addAttribute("memberModify", memberModify);
		}
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String memberModify(MemberVO memMod, Model model) throws Exception {
		logger.info("post member modify");
		
		boolean result = memberService.passChk(memMod.getUserid(), memMod.getPasswd());
		
		if (result) {
			memberService.memberModify(memMod);
			
			return "redirect:/member/list";
		} else {
			int error = 1;
			
			model.addAttribute("error", error);
			model.addAttribute("n", memMod.getRnum());
			
			return "redirect:/member/modify";
		}
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String memberDelete(MemberVO memDel, Model model) throws Exception {
		logger.info("post member delete");
		
		boolean result = memberService.passChk(memDel.getUserid(), memDel.getPasswd());
		
		if (result) {
			memberService.memberDelete(memDel.getUserid());
			
			return "redirect:/member/list";
		} else {
			int error = 1;
			
			model.addAttribute("error", error);
			model.addAttribute("n", memDel.getRnum());
			
			return "redirect:/member/view";
		}
	}
}
