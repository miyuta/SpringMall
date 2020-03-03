package com.example.spring05.service;

import java.util.List;

import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.Criteria;
import com.example.spring05.modelVO.SearchVO;

public interface BoardService {
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(Criteria criteria) throws Exception;
	public int countAll() throws Exception;
	public void boardWrite(BoardVO insVO) throws Exception;
	public BoardVO boardView(int seq) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardModify(BoardVO modVO) throws Exception;
	public void boardDelete(int seq) throws Exception;
	public List<BoardVO> boardListSch(SearchVO schVO) throws Exception;
	public int countSch(SearchVO schCntVO) throws Exception;
}
