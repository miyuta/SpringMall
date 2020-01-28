package com.example.spring03.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.CartListVO;
import com.example.spring03.domain.CartVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.OrderDetailsVO;
import com.example.spring03.domain.OrderVO;
import com.example.spring03.domain.ReplyListVO;
import com.example.spring03.domain.ReplyVO;
import com.example.spring03.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO shopDao;
	
	@Override
	public List<GoodsViewVO> shopList(int catecode, int level) throws Exception {
		
		int catecoderef = 0;
		
		if (level == 1) { //1차 분류
			catecoderef = catecode;
			return shopDao.shopList(catecode, catecoderef);
		} else {
			return shopDao.shopList(catecode);
		}
	}
	
	@Override
	public GoodsViewVO shopView(int gdsnum) throws Exception {
		return shopDao.shopView(gdsnum);
	}
	
	@Override
	public void replyInsert(ReplyVO rep_insVO) throws Exception {
		shopDao.replyInsert(rep_insVO);
	}
	
	@Override
	public List<ReplyListVO> replyList(int gdsnum) throws Exception {
		return shopDao.replyList(gdsnum);
	}
	
	@Override
	public void replyDelete(ReplyVO rep_delVO) throws Exception {
		shopDao.replyDelete(rep_delVO);
	}
	
	@Override
	public String replyIdCheck(int gdsnum) throws Exception {
		return shopDao.replyIdCheck(gdsnum);
	}
	
	@Override
	public void replyModify(ReplyVO rep_upVO) throws Exception {
		shopDao.replyModify(rep_upVO);
	}
	
	@Override
	public void cartInsert(CartVO cart_insVO) throws Exception {
		shopDao.cartInsert(cart_insVO);
	}
	
	@Override
	public List<CartListVO> cartList(String userid) throws Exception {
		return shopDao.cartList(userid);
	}
	
	@Override 
	public void cartDelete(CartVO cart_delVO) throws Exception {
		shopDao.cartDelete(cart_delVO);
	}
	
	@Override
	public void orderInsert(OrderVO ord_insVO) throws Exception {
		shopDao.orderInsert(ord_insVO);
	}
	
	@Override
	public void orderDetails(OrderDetailsVO ord_detVO) throws Exception {
		shopDao.orderDetails(ord_detVO);
	}
	
	@Override
	public void orderAftDel(String userid) throws Exception {
		shopDao.orderAftDel(userid);
	}
	
	@Override
	public List<OrderVO> orderList(String userid) throws Exception {
		return shopDao.orderList(userid);
	}
}
