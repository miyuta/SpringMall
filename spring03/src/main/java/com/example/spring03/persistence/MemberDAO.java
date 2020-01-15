package com.example.spring03.persistence;

import com.example.spring03.domain.MemberVO;

public interface MemberDAO {
	public void signUp(MemberVO vo) throws Exception;
}
