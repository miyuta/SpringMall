package com.example.spring05.service;

import com.example.spring05.model.MemberVO;

public interface LoginService {
	public MemberVO login(MemberVO login) throws Exception;
}
