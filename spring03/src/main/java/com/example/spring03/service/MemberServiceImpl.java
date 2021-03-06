package com.example.spring03.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.MemberVO;
import com.example.spring03.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDao;

	@Override
	public void signUp (MemberVO vo) throws Exception {		
		memberDao.signUp(vo);
	}
	
	@Override
	public MemberVO signIn(MemberVO vo) throws Exception {
		return memberDao.signIn(vo);
	}
	
	@Override
	public void signOut(HttpSession session) throws Exception {
		session.invalidate();
	}
}
