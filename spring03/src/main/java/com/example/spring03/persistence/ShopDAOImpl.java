package com.example.spring03.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.domain.CartListVO;
import com.example.spring03.domain.CartVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.OrderDetailsVO;
import com.example.spring03.domain.OrderVO;
import com.example.spring03.domain.ReplyListVO;
import com.example.spring03.domain.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//카테고리별 1차 분류
	@Override
	public List<GoodsViewVO> shopList(int catecode, int catecoderef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("catecode", catecode);
		map.put("catecoderef", catecoderef);
		
		return sqlSession.selectList("shop.shopList_ref", map);
	}
	
	//카테고리별 2차 분류
	@Override
	public List<GoodsViewVO> shopList(int catecode) throws Exception {
		return sqlSession.selectList("shop.shopList", catecode);
	}
	
	//상품 상세 조회
	@Override
	public GoodsViewVO shopView(int gdsnum) throws Exception {
		return sqlSession.selectOne("shop.shopView", gdsnum);
	}
	
	//댓글 작성
	@Override
	public void replyInsert(ReplyVO rep_insVO) throws Exception {
		sqlSession.insert("shop.replyInsert", rep_insVO);
	}
	
	//댓글 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsnum) throws Exception {
		return sqlSession.selectList("shop.replyList", gdsnum);
	}
	
	//댓글 삭제
	@Override
	public void replyDelete(ReplyVO rep_delVO) throws Exception {
		sqlSession.delete("shop.replyDelete", rep_delVO);
	}
	
	//댓글 삭제용 아이디 체크
	@Override
	public String replyIdCheck(int gdsnum) throws Exception {
		return sqlSession.selectOne("shop.replyIdCheck", gdsnum);
	}
	
	//댓글 수정
	@Override
	public void replyModify(ReplyVO rep_upVO) throws Exception {
		sqlSession.update("shop.replyModify", rep_upVO);
	}
	
	@Override
	public void cartInsert(CartVO cart_insVO) throws Exception {
		sqlSession.insert("shop.cartInsert", cart_insVO);
	}
	
	@Override
	public List<CartListVO> cartList(String userid) throws Exception{
		return sqlSession.selectList("shop.cartList", userid);
	}
	
	@Override
	public void cartDelete(CartVO cart_delVO) throws Exception{
		sqlSession.delete("shop.cartDelete", cart_delVO);
	}
	
	@Override
	public void orderInsert(OrderVO ord_insVO) throws Exception {
		sqlSession.insert("shop.orderInsert", ord_insVO);
	}
	
	@Override
	public void orderDetails(OrderDetailsVO ord_detVO) throws Exception {
		sqlSession.insert("shop.orderDetails", ord_detVO);
	}
	
	@Override
	public void orderAftDel(String userid) throws Exception {
		sqlSession.delete("shop.orderAftDel", userid);
	}
	
	@Override
	public List<OrderVO> orderList(String userid) throws Exception {
		return sqlSession.selectList("shop.orderList", userid);
	}
}
