package com.example.spring05.modelDAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.modelVO.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void boardWrite(BoardVO insVO) throws Exception {
		sqlSession.insert("board.boardWrite", insVO);
	}
}
