package com.example.spring05.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}

	@Override
	public BoardVO boardView(int bno) throws Exception {
		return sqlSession.selectOne("board.boardView", bno);
	}

	@Override
	public int boardInsert(BoardVO insVO) throws Exception {
		return sqlSession.insert("board.boardInsert", insVO);
	}

	@Override
	public int boardModify(BoardVO modVO) throws Exception {
		return sqlSession.update("board.boardModify", modVO);
	}

	@Override
	public int boardDelete(int bno) throws Exception {
		return sqlSession.delete("board.boardDelete", bno);
	}

}