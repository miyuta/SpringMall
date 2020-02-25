package com.example.spring04.modelDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring04.modelVO.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void boardWrite(BoardVO wrtVO) throws Exception {
		sqlSession.insert("board.boardWrite", wrtVO);
	}
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}
	
	@Override
	public List<BoardVO> boardListPage(int startRow, int endRow) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("board.boardListPaging", map);
	}
	
	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne("board.boardListCnt");
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
	public void boardUpdate(BoardVO updVO) throws Exception {
		sqlSession.update("board.boardUpdate", updVO);
	}
	
	@Override
	public void boardDelete(int seq) throws Exception {
		sqlSession.delete("board.boardDelete", seq);
	}
	
	@Override
	public List<BoardVO> boardSearch(String option, String keyword) throws Exception {
		
		Map<String, String> map = new HashMap<>();
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("board.boardSearch", map);
	}
}
