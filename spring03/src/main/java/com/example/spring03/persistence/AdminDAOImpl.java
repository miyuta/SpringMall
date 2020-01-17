package com.example.spring03.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.domain.CategoryVO;


@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryVO> category() throws Exception {
		return sqlSession.selectList("admin.category");
	}

}
