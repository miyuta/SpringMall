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
	public boolean memberLogin(MemberVO memLogin) throws Exception {
		String login = sqlSession.selectOne("login.memberLogin", memLogin);
		return (login == null) ? false : true;
	}
}
