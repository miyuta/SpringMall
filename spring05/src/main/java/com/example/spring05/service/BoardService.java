package com.example.spring05.service;

import java.util.List;

import com.example.spring05.modelVO.BoardVO;

public interface BoardService {
	public void boardWrite(BoardVO insVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardModify(BoardVO modVO) throws Exception;
}
