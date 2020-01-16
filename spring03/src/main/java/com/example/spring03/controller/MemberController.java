package com.example.spring03.controller;
  
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring03.domain.MemberVO;
import com.example.spring03.service.MemberService;
  
@Controller
@RequestMapping("/member/*") public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
  
	@Autowired
	BCryptPasswordEncoder passEncoder;
  
	@RequestMapping(value = "/signup", method = RequestMethod.GET) 
	public void getSignup() throws Exception {
		logger.info("get signUp");
	}
	//회원 가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST) 
	public String postSignup(MemberVO vo) throws Exception { 
		logger.info("post signUp");
		
		String inputPass = vo.getUserpass();
		String pass = passEncoder.encode(inputPass); vo.setUserpass(pass);
		
		service.signUp(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signIn");
	}
	
	//로그인
	@RequestMapping(value = "signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post singIn");
		
		MemberVO signin = service.signIn(vo);
		HttpSession session = req.getSession();
		
		if (signin != null) {
			boolean passMatch = passEncoder.matches(vo.getUserpass(), signin.getUserpass());
			if (passMatch) {
				session.setAttribute("member", signin);
			} else {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/signin";
			}
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		return "redirect:/";
	}
	
	//로그 아웃
	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get SignOut");
		
		service.signOut(session);
		
		return "redirect:/";
	}
}
 
