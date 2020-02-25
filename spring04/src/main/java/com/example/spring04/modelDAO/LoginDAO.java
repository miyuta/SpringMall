package com.example.spring04.modelDAO;

import com.example.spring04.modelVO.MemberVO;

public interface LoginDAO {
	public MemberVO memberLogin(MemberVO memLogin) throws Exception;
}
