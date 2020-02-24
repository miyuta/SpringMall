package com.example.spring04.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.spring04.modelVO.MemberVO;
import com.example.spring04.service.LoginService;

@Controller
@RequestMapping(value="login/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private LoginService loginService;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void memberLogin() throws Exception {
		logger.info("get login");
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String memberLogin(MemberVO memLogin, Model model, HttpSession session) throws Exception {
		
		boolean login = loginService.memberLogin(memLogin, session);
		
		
		if (login == true) {
			model.addAttribute("message", "success");
			model.addAttribute("userid", memLogin.getUserid());
			return "redirect:/";
		} else {
			model.addAttribute("message", "failed");
			return "redirect:/login/login";
		}
	}
	
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String memberLogout(HttpSession session) throws Exception {
		
		loginService.memberLogout(session);
		
		return "redirect:/";
	}
}
