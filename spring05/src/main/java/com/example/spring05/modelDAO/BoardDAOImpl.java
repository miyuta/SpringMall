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
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}

	@Override
	public void boardWrite(BoardVO insVO) throws Exception {
		sqlSession.insert("board.boardWrite", insVO);
	}

	@Override
	public BoardVO boardView(int seq) throws Exception {
		return sqlSession.selectOne("board.boardView", seq);
	}
	
	@Override
	public int passChk(BoardVO passChk) throws Exception {
		return sqlSession.selectOne("board.passChk", passChk);
	}

	@Override
	public void boardModify(BoardVO modVO) throws Exception {
		sqlSession.update("board.boardUpdate", modVO);
	}

	@Override
	public void boardDelete(int seq) throws Exception {
		sqlSession.delete("board.boardDelete", seq);
	}
}
