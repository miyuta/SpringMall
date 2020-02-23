package com.example.spring04.modelDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring04.modelVO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void memberRegister(MemberVO memReg) throws Exception {
		sqlSession.insert("member.memberRegister", memReg);
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception {	
		return sqlSession.selectList("member.memberList");
	}
	
	@Override
	public MemberVO memberView(int rnum) throws Exception {
		return sqlSession.selectOne("member.memberView", rnum);
	}
	
	@Override
	public void memberModify(MemberVO memMod) throws Exception {
		sqlSession.update("member.memberModify", memMod);
	}
	
	@Override
	public boolean passChk(String userid, String passwd) throws Exception {
		boolean result = false;
		Map<String, String> map =  new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		
		int passChk = sqlSession.selectOne("member.passChk", map);
		
		if (passChk == 1) result = true;
		return result;
	}
	
	@Override
	public void memberDelete(String userid) throws Exception {
		sqlSession.delete("member.memberDelete", userid);
	}
	
	@Override
	public List<MemberVO> memberSearch(String option, String keyword) {
		Map<String, String> map =new HashMap<>();
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("member.memberSearch", map);
	}
	
	@Override
	public int memberAllCnt() throws Exception {
		return sqlSession.selectOne("member.memberAllCount");
	}
	
	@Override
	public int memberSelCnt(String option, String keyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("option", option);
		map.put("keyword", keyword);
		
		int SelCtn = sqlSession.selectOne("member.memberSelConut", map);
		return SelCtn;
	}
}
