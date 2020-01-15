package com.example.spring03.controller;
  
import javax.inject.Inject;
  
import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
  
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
	public void getSignup() throws Exception { logger.info("get signUp"); }
  
	@RequestMapping(value = "/signup", method = RequestMethod.POST) 
	public String postSignup(MemberVO vo) throws Exception { 
		logger.info("post signUp");
		
		String inputPass = vo.getUserpass();
		String pass = passEncoder.encode(inputPass); vo.setUserpass(pass);
		
		service.signUp(vo);
		
		return "redirect:/";
	}
}
 
