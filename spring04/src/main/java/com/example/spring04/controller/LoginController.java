package com.example.spring04.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring04.modelVO.MemberVO;
import com.example.spring04.service.LoginService;

@Controller
@RequestMapping(value="login/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private LoginService loginService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void memberLogin() throws Exception {
		logger.info("get login");
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String memberLogin(MemberVO memLogin, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("post login");
		
		MemberVO login = loginService.memberLogin(memLogin);
		
		boolean passMatch = passEncoder.matches(memLogin.getPasswd(), login.getPasswd());

		if (login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("message", "false");
			return "redirect:/login/login/";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) throws Exception {
		
		loginService.memberLogout(session);
		
		return "redirect:/";
	}
}
