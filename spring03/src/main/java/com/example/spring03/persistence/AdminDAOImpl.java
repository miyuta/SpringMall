package com.example.spring03.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.domain.CategoryVO;
import com.example.spring03.domain.GoodsVO;


@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return sqlSession.selectList("admin.category");
	}
	
	@Override
	public void register(GoodsVO gds_regVO) throws Exception {
		sqlSession.insert("admin.register", gds_regVO);
	}
	
	@Override
	public List<GoodsVO> goodsList() throws Exception {
		return sqlSession.selectList("admin.goodsList");
	}
	
	@Override
	public GoodsVO goodsView(int gdsnum) throws Exception {
		return sqlSession.selectOne("admin.goodsView", gdsnum);
	}
}
