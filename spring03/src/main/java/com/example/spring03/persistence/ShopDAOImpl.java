package com.example.spring03.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.domain.GoodsViewVO;

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
}
