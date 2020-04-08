package com.example.spring05.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String passChk(int bno) throws Exception {
		return sqlSession.selectOne("board.passChk", bno);
	}
	
	@Override
	public int countAll() throws Exception {
		return sqlSession.selectOne("board.countAll");
	}

	@Override
	public int countSch(SearchVO schVO) throws Exception {
		return sqlSession.selectOne("board.countSch", schVO);
	}
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}
	
	@Override
	public List<BoardVO> boardListPage(PaginationVO pageVO) throws Exception {
		return sqlSession.selectList("board.boardListPage", pageVO);
	}
	
	@Override
	public List<BoardVO>boardListPageSch(SearchVO schVO) throws Exception {
		return sqlSession.selectList("board.boardListPageSch", schVO);
	}
	
	@Override
	public void viewCnt(int bno) throws Exception {
		sqlSession.update("board.viewCnt", bno);
	}

	@Override
	public BoardVO boardView(int bno) throws Exception {
		return sqlSession.selectOne("board.boardView", bno);
	}

	@Override
	public int boardWrite(BoardVO wrtVO) throws Exception {
		return sqlSession.insert("board.boardWrite", wrtVO);
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
