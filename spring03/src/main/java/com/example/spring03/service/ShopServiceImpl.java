package com.example.spring03.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.domain.GoodsViewVO;
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
}
