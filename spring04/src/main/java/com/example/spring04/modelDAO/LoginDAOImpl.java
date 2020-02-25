package com.example.spring04.modelDAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring04.modelVO.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVO memberLogin(MemberVO memLogin) throws Exception {
		return sqlSession.selectOne("login.memCptLogin", memLogin);
	}
}
