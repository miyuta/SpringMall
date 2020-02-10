package com.example.spring04.service;

import java.util.List;

import com.example.spring04.modelVO.BoardVO;

public interface BoardService {
	public void boardWrite(BoardVO wrtVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public BoardVO boardView(int seq) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardUpdate(BoardVO updVO) throws Exception;
	public void boardDelete(int seq) throws Exception;
}
