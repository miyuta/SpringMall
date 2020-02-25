package com.example.spring04.service;

import javax.servlet.http.HttpSession;

import com.example.spring04.modelVO.MemberVO;

public interface LoginService {
	public MemberVO memberLogin(MemberVO memLogin) throws Exception;
	public void memberLogout(HttpSession session) throws Exception;
}
