package com.example.spring05.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.dao.LoginDAO;
import com.example.spring05.model.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO loginDao;
	
	@Override
	public MemberVO login(MemberVO login) throws Exception {
		return loginDao.login(login);
	}
}
