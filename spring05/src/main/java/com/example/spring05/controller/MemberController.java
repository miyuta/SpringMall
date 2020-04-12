package com.example.spring05.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring05.model.MemberVO;
import com.example.spring05.model.PageMaker;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;
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
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/idDubChk", method=RequestMethod.POST)
	public int idDubChk(@RequestBody String userid) throws Exception {
		logger.info("post member idDubChk");
		
		return memberService.idDubChk(userid);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void memberList(Model model) throws Exception {
		logger.info("get member list");
		
		model.addAttribute("memberList", memberService.memberList());
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void memberListPage(PaginationVO pageVO, Model model) throws Exception {
		logger.info("get member listpage");
		
		model.addAttribute("memberListPage", memberService.memberListPage(pageVO.getStartPost(), pageVO.getEndPost()));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageVO(pageVO);
		pageMaker.setTotalPost(memberService.countAll());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/listPageSch", method=RequestMethod.GET)
	public void memberListPageSch(@ModelAttribute("schVO") SearchVO schVO, Model model) throws Exception {
		logger.info("get member listpagesch");
		
		model.addAttribute("memberListPageSch", memberService.memberListPageSch(schVO));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPageVO(schVO);
		pageMaker.setTotalPost(memberService.countSch(schVO));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void memberRegister() throws Exception {
		logger.info("get member register");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String memberRegister(MemberVO memRegVO) throws Exception {
		logger.info("post member register");
		
		int result = memberService.idDubChk(memRegVO.getUserid());
		try {
			if (result == 1) {
				return "redirect:/member/register";
			} else {
			memberService.memberRegister(memRegVO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/member/list";
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void memberView(@RequestParam("userid")  String userid, @ModelAttribute SearchVO schVO, Model model) throws Exception {
		logger.info("get member view");
		
		model.addAttribute("memberView", memberService.memberView(userid));
		model.addAttribute("schVO", schVO);
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void memebrModify(@RequestParam("userid") String userid, @ModelAttribute SearchVO schVO, Model model) throws Exception {
		logger.info("get member modify");
		
		model.addAttribute("memberModify", memberService.memberView(userid));
		model.addAttribute("schVO", schVO);
		
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String memberModify(MemberVO memModVO) throws Exception {
		logger.info("post member modify");
		
		memberService.memberModify(memModVO);
		
		return "redirect:/member/view?userid=" + memModVO.getUserid();
	}

	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String memberDelete(MemberVO memDelVO) throws Exception {
		logger.info("post member delete");
		
		memberService.memberDelete(memDelVO);
		
		return "return:/list";
	}
}
