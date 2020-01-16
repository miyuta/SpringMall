package com.example.spring03.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void signUp(MemberVO vo) throws Exception {
		sqlSession.insert("shomall.signUp", vo);
	}
	
	@Override
	public MemberVO signIn(MemberVO vo) throws Exception {
		return sqlSession.selectOne("shomall.signIn", vo);
	}
}
