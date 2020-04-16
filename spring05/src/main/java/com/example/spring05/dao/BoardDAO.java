package com.example.spring05.dao;

import java.util.List;
import java.util.Map;

import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;

public interface BoardDAO {
	public String passChk(int bno) throws Exception;
	public int countAll() throws Exception;
	public int countSch(SearchVO schVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(PaginationVO pageVO) throws Exception;
	public List<BoardVO> boardListPageSch(SearchVO schVO) throws Exception;
	public void viewCnt(int bno) throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public void boardWrite(BoardVO wrtVO) throws Exception;
	public void fileUpload(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> fileList(int bno) throws Exception;
	public Map<String, Object> fileDownload(int fno) throws Exception;
	public void fileUpdate(Map<String, Object> tempMap) throws Exception;
	public void boardModify(BoardVO modVO) throws Exception;
	public int boardDelete(int bno) throws Exception;
}
