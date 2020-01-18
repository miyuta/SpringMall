package com.example.spring03.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDao;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return adminDao.category();
	}
	
	@Override
	public void register(GoodsVO gds_regVO) throws Exception {
		adminDao.register(gds_regVO);
	}
	
	@Override
	public List<GoodsVO> goodsList() throws Exception {
		return adminDao.goodsList();
	}
}
