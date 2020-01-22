package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.GoodsViewVO;

public interface ShopDAO {
	public List<GoodsViewVO> shopList(int catecode) throws Exception;
	public List<GoodsViewVO> shopList(int catecode, int catecoderef) throws Exception;
}
