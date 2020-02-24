package com.example.spring04.modelDAO;

import com.example.spring04.modelVO.MemberVO;

public interface LoginDAO {
	public boolean memberLogin(MemberVO memLogin) throws Exception;
}
