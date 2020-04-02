package com.example.spring05.dao;

import java.util.List;

import com.example.spring05.model.MemberVO;

public interface MemberDAO {
	public List<MemberVO> memberList() throws Exception;
	public void memberRegister(MemberVO memRegVO) throws Exception;
	public MemberVO memberView(MemberVO memViewVO) throws Exception;
	public void memberModify(MemberVO memModVO) throws Exception;
	public void memberAccess(MemberVO memAccVO) throws Exception;
	public void memberDelete(MemberVO memDelVO) throws Exception;
}
