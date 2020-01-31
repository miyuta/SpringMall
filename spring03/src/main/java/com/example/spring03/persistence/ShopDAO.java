package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.CartListVO;
import com.example.spring03.domain.CartVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.OrderDetailsVO;
import com.example.spring03.domain.OrderListVO;
import com.example.spring03.domain.OrderVO;
import com.example.spring03.domain.ReplyListVO;
import com.example.spring03.domain.ReplyVO;

public interface ShopDAO {
	public List<GoodsViewVO> shopList(int catecode) throws Exception;
	public List<GoodsViewVO> shopList(int catecode, int catecoderef) throws Exception;
	public GoodsViewVO shopView(int gdsnum) throws Exception;
	public void replyInsert(ReplyVO rep_insVO) throws Exception;
	public List<ReplyListVO> replyList(int gdsnum) throws Exception;
	public void replyDelete(ReplyVO rep_delVO) throws Exception;
	public String replyIdCheck(int gdsnum) throws Exception;
	public void replyModify(ReplyVO rep_upVO) throws Exception;
	public void cartInsert(CartVO cart_insVO) throws Exception;
	public List<CartListVO> cartList(String userid) throws Exception;
	public void cartDelete(CartVO cart_delVO) throws Exception;
	public void changeStock(GoodsVO gds_chnVO) throws Exception;
	public void orderInsert(OrderVO ord_insVO) throws Exception;
	public void orderDetails(OrderDetailsVO ord_detVO) throws Exception;
	public void orderAftDel(String userid) throws Exception;
	public List<OrderVO> orderList(String userid) throws Exception;
	public List<OrderListVO> orderView(OrderVO ord_viewVO) throws Exception;
}
