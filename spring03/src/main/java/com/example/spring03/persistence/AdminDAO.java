package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.OrderListVO;
import com.example.spring03.domain.OrderVO;
import com.example.spring03.domain.ReplyListVO;


public interface AdminDAO {
	public List<CategoryVO> category() throws Exception;
	public void goodsRegister(GoodsVO gds_regVO) throws Exception;
	public List<GoodsViewVO> goodsList() throws Exception;
	public GoodsViewVO goodsView(int gdsnum) throws Exception;
	public void goodsModify(GoodsVO gds_modVO) throws Exception;
	public void goodsDelete(int gdsnum) throws Exception;
	public List<OrderVO> orderList() throws Exception;
	public void orderCancel(GoodsVO ord_canVO) throws Exception;
	public void orderDelete(String orderid) throws Exception;
	public List<OrderListVO> orderView(OrderVO ord_viewVO) throws Exception;
	public void delivery(OrderVO ord_upVO) throws Exception;
	public List<ReplyListVO> allReply() throws Exception;
	public void replyDelete(int repnum) throws Exception;
}
