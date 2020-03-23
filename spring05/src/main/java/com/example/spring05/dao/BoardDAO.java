package com.example.spring05.dao;

import java.util.List;

import com.example.spring05.model.BoardVO;

public interface BoardDAO {
	public List<BoardVO> boardList() throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public int boardWrite(BoardVO wrtVO) throws Exception;
	public int boardModify(BoardVO modVO) throws Exception;
	public int boardDelete(int bno) throws Exception;
}
