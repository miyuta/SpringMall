package com.example.spring05.dao;

import com.example.spring05.model.MemberVO;

public interface LoginDAO {
	public MemberVO login(MemberVO login) throws Exception;
}
