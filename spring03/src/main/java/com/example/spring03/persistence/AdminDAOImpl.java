package com.example.spring03.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;
import com.example.spring03.domain.GoodsViewVO;


@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return sqlSession.selectList("admin.category");
	}
	
	@Override
	public void goodsRegister(GoodsVO gds_regVO) throws Exception {
		sqlSession.insert("admin.register", gds_regVO);
	}
	
	@Override
	public List<GoodsViewVO> goodsList() throws Exception {
		return sqlSession.selectList("admin.goodsList");
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsnum) throws Exception {
		return sqlSession.selectOne("admin.goodsView", gdsnum);
	}
	
	@Override
	public void goodsModify(GoodsVO gds_modVO) throws Exception {
		sqlSession.update("admin.goodsModify", gds_modVO);
	}
	
	@Override
	public void goodsDelete(int gdsnum) throws Exception {
		sqlSession.delete("admin.goodsDelete", gdsnum);
	}
}
