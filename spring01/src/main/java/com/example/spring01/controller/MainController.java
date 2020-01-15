package com.example.spring01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		return "main";
	}
}
