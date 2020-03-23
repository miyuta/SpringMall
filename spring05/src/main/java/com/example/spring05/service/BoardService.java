package com.example.spring05.service;

import java.util.List;

import com.example.spring05.model.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList() throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public int boardInsert(BoardVO insVO) throws Exception;
	public int boardModify(BoardVO modVO) throws Exception;
	public int boardDelete(int bno) throws Exception;
}
