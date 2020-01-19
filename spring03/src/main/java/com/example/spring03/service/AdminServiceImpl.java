package com.example.spring03.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;
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
	public void goodsRegister(GoodsVO gds_regVO) throws Exception {
		adminDao.goodsRegister(gds_regVO);
	}
	
	@Override
	public List<GoodsVO> goodsList() throws Exception {
		return adminDao.goodsList();
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsnum) throws Exception {
		return adminDao.goodsView(gdsnum);
	}
	
	@Override
	public void goodsModify(GoodsVO gds_modVO) throws Exception {
		adminDao.goodsModify(gds_modVO);
	}
	
	@Override
	public void goodsDelete(int gdsnum) throws Exception {
		adminDao.goodsDelete(gdsnum);
	}
}
