package com.example.spring04.modelDAO;

import java.util.List;

import com.example.spring04.modelVO.MemberVO;

public interface MemberDAO {
	public void memberRegister(MemberVO memReg) throws Exception;
	public List<MemberVO> memberList() throws Exception;
	public MemberVO memberView(int rnum) throws Exception;
	public void memberModify(MemberVO memMod) throws Exception;
	public boolean passChk(String userid, String passwd) throws Exception;
	public void memberDelete(String userid) throws Exception;
}
