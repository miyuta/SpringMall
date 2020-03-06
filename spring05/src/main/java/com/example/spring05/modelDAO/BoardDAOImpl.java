package com.example.spring05.modelDAO;

import java.util.List;

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
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}
	
	@Override
	public BoardVO boardView(int bno) throws Exception {
		return sqlSession.selectOne("board.boardView", bno);
	}
	
	@Override
	public int passChk(BoardVO passChk) throws Exception {
		return sqlSession.selectOne("board.passChk", passChk);
	}
	
	@Override
	public void boardModify(BoardVO modVO) throws Exception {
		sqlSession.update("board.boardModify", modVO);
	}
}
