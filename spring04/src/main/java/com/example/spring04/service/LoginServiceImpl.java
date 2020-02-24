package com.example.spring04.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.spring04.modelDAO.LoginDAO;
import com.example.spring04.modelVO.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	private LoginDAO loginDao;
	
	@Override
	public boolean memberLogin(MemberVO memLogin, HttpSession session) throws Exception {
		boolean login =  loginDao.memberLogin(memLogin);
		if (login) {
			session.setAttribute("userid", memLogin.getUserid());
		}
		return login;
	}
	
	@Override
	public void memberLogout(HttpSession session) throws Exception {
		session.invalidate();
	}
}
