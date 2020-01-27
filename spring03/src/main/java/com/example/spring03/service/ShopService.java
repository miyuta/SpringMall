package com.example.spring03.service;

import java.util.List;

import com.example.spring03.domain.CartListVO;
import com.example.spring03.domain.CartVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.ReplyListVO;
import com.example.spring03.domain.ReplyVO;

public interface ShopService {
	//카테고리별 상품 리스트
	public List<GoodsViewVO> shopList(int catecode, int level) throws Exception;
	public GoodsViewVO shopView(int gdsnum) throws Exception;
	public void replyInsert(ReplyVO rep_insVO) throws Exception;
	public List<ReplyListVO> replyList(int gdsnum) throws Exception;
	public void replyDelete(ReplyVO rep_delVO) throws Exception;
	public String replyIdCheck(int gdsnum) throws Exception;
	public void replyModify(ReplyVO rep_upVO) throws Exception;
	public void cartInsert(CartVO cart_insVO) throws Exception;
	public List<CartListVO> cartList(String userid) throws Exception;
}
