package com.example.spring04.service;

import java.util.List;

import com.example.spring04.modelVO.MemberVO;

public interface MemberService {
	public void memberRegister(MemberVO memReg) throws Exception;
	public List<MemberVO> memberList() throws Exception;
	public MemberVO memberView(int rnum) throws Exception;
	public void memberModify(MemberVO memMod) throws Exception;
	public boolean passChk(String userid, String passwd) throws Exception;
	public void memberDelete(String string) throws Exception;
	public String message(int error) throws Exception;
}
