package com.example.spring05.dao;

import java.util.List;

import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;

public interface BoardDAO {
	public String passChk(int bno) throws Exception;
	public int countAll() throws Exception;
	public int countSch() throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(PaginationVO pageVO) throws Exception;
	public List<BoardVO> boardListPageSch(SearchVO schVO) throws Exception;
	public void viewCnt(int bno) throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public int boardWrite(BoardVO wrtVO) throws Exception;
	public int boardModify(BoardVO modVO) throws Exception;
	public int boardDelete(int bno) throws Exception;
}
