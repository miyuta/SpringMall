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
	public String passChk(String userid) throws Exception {
		return memberDao.passChk(userid);
	}
	
	@Override
	public int countAll() throws Exception {
		return memberDao.countAll();
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		return memberDao.memberList();
	}
	
	@Override
	public List<MemberVO> memberListPage(int startPost, int endPost) throws Exception {
		return memberDao.memberListPage(startPost, endPost);
	}

	@Override
	public void memberRegister(MemberVO memRegVO) throws Exception {
		memRegVO.setUsername(memRegVO.getFamilyname() + " " + memRegVO.getLastname());
		
		if (memRegVO.getUserphone() != null) {
			memRegVO.setUserphone(memRegVO.getFstnum() + "-" + memRegVO.getSndnum() + "-" + memRegVO.getThdnum());
		}
		memberDao.memberRegister(memRegVO);
	}

	@Override
	public MemberVO memberView(String userid) throws Exception {
		MemberVO memberView = memberDao.memberView(userid);
		
		String[] username = memberView.getUsername().split(" ");
		memberView.setFamilyname(username[0]);
		memberView.setLastname(username[1]);
		
		if (memberView.getUserphone() != null) {
			String[] userphone = memberView.getUserphone().split("-");
			memberView.setFstnum(userphone[0]);
			memberView.setSndnum(userphone[1]);
			memberView.setThdnum(userphone[2]);
		}
		
		return memberView;
	}

	@Override
	public void memberModify(MemberVO memModVO) throws Exception {
		memModVO.setUsername(memModVO.getFamilyname() + " " + memModVO.getLastname());
		
		String phone = memModVO.getFstnum() + "-" + memModVO.getSndnum() + "-" + memModVO.getThdnum();
		System.out.println(phone.replaceAll("-", ""));
		
		if (phone.replaceAll("-", "") != null) {
			memModVO.setUserphone(phone);
		} else {
			memModVO.setUserphone(null);
		}
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
