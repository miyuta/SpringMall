package com.example.spring05.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.dao.MemberDAO;
import com.example.spring05.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDao;
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		return memberDao.memberList();
	}

	@Override
	public void memberRegister(MemberVO memRegVO) throws Exception {
		memberDao.memberRegister(memRegVO);
	}

	@Override
	public MemberVO memberView(MemberVO memViewVO) throws Exception {
		return memberDao.memberView(memViewVO);
	}

	@Override
	public void memberModify(MemberVO memModVO) throws Exception {
		memberDao.memberModify(memModVO);
	}

	@Override
	public void memberAccess(MemberVO memAccVO) throws Exception {
		memberDao.memberAccess(memAccVO);
		
	}

	@Override
	public void memberDelete(MemberVO memDelVO) throws Exception {
		memberDao.memberDelete(memDelVO);
	}

}
