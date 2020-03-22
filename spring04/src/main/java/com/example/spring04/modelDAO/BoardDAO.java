package com.example.spring04.modelDAO;

import java.util.List;
import java.util.Map;

import com.example.spring04.modelVO.BoardVO;
import com.example.spring04.modelVO.Criteria;
import com.example.spring04.modelVO.SearchCriteria;

public interface BoardDAO {
	public void boardWrite(BoardVO wrtVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(int startRow, int endRow) throws Exception;
	public int listCount() throws Exception;
	public BoardVO boardView(int seq) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardUpdate(BoardVO updVO) throws Exception;
	public void boardDelete(int seq) throws Exception;
	public List<BoardVO> boardListSchPage(BoardVO SchPage) throws Exception;
	public int boardSelCount(String option, String keyword) throws Exception;
	
	public List<BoardVO> ListPage(Criteria cri) throws Exception;
	public List<BoardVO> ListSchPage(SearchCriteria scri) throws Exception;
	public void insertFile(Map<String, Object> map) throws Exception;
}
