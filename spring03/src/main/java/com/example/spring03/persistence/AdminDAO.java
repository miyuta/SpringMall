package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;


public interface AdminDAO {
	public List<CategoryVO> category() throws Exception;
	public void register(GoodsVO gds_regVO) throws Exception;
	public List<GoodsVO> goodsList() throws Exception;
	public GoodsVO goodsView(int gdsnum) throws Exception;
}
