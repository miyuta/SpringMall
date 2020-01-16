package com.example.spring03.service;

import javax.servlet.http.HttpSession;

import com.example.spring03.domain.MemberVO;

public interface MemberService {
	public void signUp(MemberVO vo) throws Exception;
	public MemberVO signIn(MemberVO vo) throws Exception;
	public void signOut(HttpSession sessoin) throws Exception;
}
