package com.example.spring03.service;

import java.util.List;

import com.example.spring03.domain.GoodsViewVO;

public interface ShopService {
	//카테고리별 상품 리스트
	public List<GoodsViewVO> shopList(int catecode, int level) throws Exception;
}
