package com.example.spring04.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.spring04.modelVO.BoardVO;
import com.example.spring04.modelVO.Criteria;
import com.example.spring04.modelVO.SearchCriteria;

public interface BoardService {
	public void boardWrite(BoardVO wrtVO, MultipartHttpServletRequest mpRequest) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(int startRow, int endRow) throws Exception;
	public int listCount() throws Exception;
	public BoardVO boardView(int seq) throws Exception;
	public int passChk(BoardVO passChk) throws Exception;
	public void boardUpdate(BoardVO updVO) throws Exception;
	public void boardDelete(int seq) throws Exception;
	public List<BoardVO> boardListSchPage(String option, String keyword, int startRow, int endRow) throws Exception;
	public int boardSelCount(String option, String keyword) throws Exception;
	
	
	public List<BoardVO> ListPage(Criteria cri) throws Exception;
	public List<BoardVO> ListSchPage(SearchCriteria scri) throws Exception;
}
