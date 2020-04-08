package com.example.spring05.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.MemberVO;
import com.example.spring05.model.SearchVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String passChk(String userid) throws Exception {
		return sqlSession.selectOne("member.memberPasschk", userid);
	}
	
	@Override
	public int countAll() throws Exception {
		return sqlSession.selectOne("member.countAll");
	}
	
	@Override
	public int countSch(SearchVO schVO) throws Exception {
		return sqlSession.selectOne("member.countSch", schVO);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return sqlSession.selectList("member.memberList");
	}
	
	@Override
	public List<MemberVO> memberListPage(int startPost, int endPost) throws Exception {
		
		Map<String, Integer> postRange = new HashMap<String, Integer>();
		postRange.put("startPost", startPost);
		postRange.put("endPost", endPost);
		
		return sqlSession.selectList("member.memberListPage", postRange);
	}
	
	@Override
	public List<MemberVO> memberListPageSch(SearchVO schVO) throws Exception {
		return sqlSession.selectList("member.memberListPageSch", schVO);
	}

	@Override
	public void memberRegister(MemberVO memRegVO) throws Exception {
		sqlSession.insert("member.memberRegister", memRegVO);
	}

	@Override
	public MemberVO memberView(String userid) throws Exception {
		return sqlSession.selectOne("member.memberView", userid);
	}

	@Override
	public void memberModify(MemberVO memModVO) throws Exception {
		sqlSession.update("member.memberModify", memModVO);
	}

	@Override
	public void memberAccess(MemberVO memAccVO) throws Exception {
		sqlSession.selectOne("member.memberAccess", memAccVO);
	}

	@Override
	public void memberDelete(MemberVO memDelVO) throws Exception {
		sqlSession.delete("member.memberDelete", memDelVO);
	}
}
