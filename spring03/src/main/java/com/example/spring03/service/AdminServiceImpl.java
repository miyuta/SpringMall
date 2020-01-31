package com.example.spring03.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.OrderListVO;
import com.example.spring03.domain.OrderVO;
import com.example.spring03.domain.ReplyListVO;
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
	public List<GoodsViewVO> goodsList() throws Exception {
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
	
	@Override
	public List<OrderVO> orderList() throws Exception {
		return adminDao.orderList();
	}
	
	@Override
	public void orderCancel(GoodsVO ord_canVO) throws Exception {
		adminDao.orderCancel(ord_canVO);
	}
	
	@Override
	public void orderDelete(String orderid) throws Exception {
		adminDao.orderDelete(orderid);
	}
	
	@Override
	public List<OrderListVO> orderView(OrderVO ord_viewVO) throws Exception {
		return adminDao.orderView(ord_viewVO);
	}
	@Override
	public void delivery(OrderVO ord_upVO) throws Exception {
		adminDao.delivery(ord_upVO);
	}
	
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return adminDao.allReply();
	}
	
	@Override
	public void replyDelete(int repnum) throws Exception {
		adminDao.replyDelete(repnum);
	}
}
