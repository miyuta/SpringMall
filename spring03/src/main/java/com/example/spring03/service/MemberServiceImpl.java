package com.example.spring03.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.MemberVO;
import com.example.spring03.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;

	@Override
	public void signUp(MemberVO vo) throws Exception {		
		dao.signUp(vo);
	}
}
