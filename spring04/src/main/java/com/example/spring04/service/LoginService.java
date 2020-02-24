package com.example.spring04.service;

import javax.servlet.http.HttpSession;

import com.example.spring04.modelVO.MemberVO;

public interface LoginService {
	public boolean memberLogin(MemberVO memLogin, HttpSession session) throws Exception;
	public void memberLogout(HttpSession session) throws Exception;
}
