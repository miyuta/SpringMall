package com.example.spring05.modelDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.PageSchMaker;

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
	public List<BoardVO> boardListPage(int startPost, int endPost) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPost", startPost);
		map.put("endPost", endPost);
		
		return sqlSession.selectList("board.boardListPage", map);
	}
	
	@Override
	public List<BoardVO> boardListPageSch(PageSchMaker pageSchVO) throws Exception {
		return sqlSession.selectList("board.boardListPageSch", pageSchVO);
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
	
	@Override
	public void boardDelete(int bno) throws Exception {
		sqlSession.delete("board.boardDelete", bno);
	}
	
	@Override
	public int countAll() throws Exception {
		return sqlSession.selectOne("board.countAll");
	}

	@Override
	public int countSch(PageSchMaker pageSchVO) throws Exception {
		return sqlSession.selectOne("board.countSch");
	}
}
