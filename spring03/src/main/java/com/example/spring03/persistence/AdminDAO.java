package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;


public interface AdminDAO {
	public List<CategoryVO> category() throws Exception;
	public void goodsRegister(GoodsVO gds_regVO) throws Exception;
	public List<GoodsViewVO> goodsList() throws Exception;
	public GoodsViewVO goodsView(int gdsnum) throws Exception;
	public void goodsModify(GoodsVO gds_modVO) throws Exception;
	public void goodsDelete(int gdsnum) throws Exception;
}
