package com.example.spring04.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring04.modelDAO.MemberDAO;
import com.example.spring04.modelVO.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDao;
	
	@Override
	public void memberRegister(MemberVO memReg) throws Exception {
		memberDao.memberRegister(memReg);
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		return memberDao.memberList();
	}
	
	@Override
	public MemberVO memberView(int rnum) throws Exception {
		return memberDao.memberView(rnum);
	}
	
	@Override
	public void memberModify(MemberVO memMod) throws Exception {
		memberDao.memberModify(memMod);
	}
	
	@Override
	public boolean passChk(String userid, String passwd) throws Exception {
		return memberDao.passChk(userid, passwd);
	}
	
	@Override
	public void memberDelete(String userid) throws Exception {
		memberDao.memberDelete(userid);
	}
	
	@Override
	public String message(int error) throws Exception {
		
		String message = "";
		if (error == 1) {
			message = "비밀번호를 확인해주세요.";
		}
		return message;
	}
}
