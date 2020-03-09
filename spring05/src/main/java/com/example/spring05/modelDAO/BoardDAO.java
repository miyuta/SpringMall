package com.example.spring05.modelDAO;

import java.util.List;

import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.PageSchMaker;

public interface BoardDAO {
	public void boardWrite(BoardVO insVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(int startPost, int endPost) throws Exception;
	public List<BoardVO> boardListPageSch(PageSchMaker pageSch) throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardModify(BoardVO modVO) throws Exception;
	public void boardDelete(int bno) throws Exception;
	public int countAll() throws Exception;
	public int countSch(String option, String keyword) throws Exception;
}
