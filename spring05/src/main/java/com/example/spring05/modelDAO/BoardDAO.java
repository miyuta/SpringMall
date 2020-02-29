package com.example.spring05.modelDAO;

import java.util.List;

import com.example.spring05.modelVO.BoardVO;

public interface BoardDAO {
	public List<BoardVO> boardList() throws Exception;
	public void boardWrite(BoardVO insVO) throws Exception;
	public BoardVO boardView(int seq) throws Exception;
	public void boardModify(BoardVO modVO) throws Exception;
	public void boardDelete(int seq) throws Exception;
}
