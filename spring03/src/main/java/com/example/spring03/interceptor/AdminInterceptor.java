package com.example.spring03.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.spring03.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if (member == null) {
			res.sendRedirect("/spring03/member/signin");
			return false;
		}
		
		if (member.getVerify() != 9) {
			res.sendRedirect("/spring03/");
			return false;
		}
		return true;
	}
}
