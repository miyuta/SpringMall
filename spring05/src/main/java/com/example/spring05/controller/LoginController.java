package com.example.spring05.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring05.model.MemberVO;
import com.example.spring05.service.LoginService;

@Controller
@RequestMapping(value="/login/*")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private LoginService loginService;
	
	@Inject
	private BCryptPasswordEncoder passEncoder;

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() throws Exception {
		logger.info("get login");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO login, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO member = loginService.login(login);
		
		boolean passMatch = passEncoder.matches(login.getPasswd(), member.getPasswd());
		
		if (member != null && passMatch) {
			session.setAttribute("member", member);
			return "redirect:/";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("message", true);
			return "redirect:/login/login";
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");
		
		session.invalidate();
		
		return "redirect:/";
	}
}
