package com.example.spring05.service;

import java.util.List;

import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.PageSchMaker;

public interface BoardService {
	public void boardWrite(BoardVO insVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(int startPost, int endPost) throws Exception;
	public List<BoardVO> boardListPageSch(PageSchMaker pageSchVO) throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardModify(BoardVO modVO) throws Exception;
	public void boardDelete(int bno) throws Exception;
	public int countAll() throws Exception;
	public int countSch(PageSchMaker pageSchVO) throws Exception;
}
