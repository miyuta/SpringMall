package com.example.spring05.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String passChk(String userid) throws Exception {
		return sqlSession.selectOne("member.memberPasschk", userid);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return sqlSession.selectList("member.memberList");
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
