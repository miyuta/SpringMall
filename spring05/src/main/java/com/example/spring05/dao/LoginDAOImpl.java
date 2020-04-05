package com.example.spring05.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVO login(MemberVO login) throws Exception {
		return sqlSession.selectOne("login.login", login);
	}
}
