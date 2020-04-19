package com.example.spring05.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;

public interface BoardService {
	public String passChk(int bno) throws Exception;
	public int countAll() throws Exception;
	public int countSch(SearchVO schVO) throws Exception;
	public List<BoardVO> boardList() throws Exception;
	public List<BoardVO> boardListPage(PaginationVO pageVO) throws Exception;
	public List<BoardVO> boardListPageSch(SearchVO schVO) throws Exception;
	public BoardVO boardView(int bno) throws Exception;
	public void boardWrite(BoardVO wrtVO, MultipartHttpServletRequest mpRequest) throws Exception;
	public List<Map<String, Object>> fileList(int bno) throws Exception;
	public Map<String, Object> fileDownload(int fno) throws Exception;
	public void boardModify(BoardVO modVO, String[] files, MultipartHttpServletRequest mpRequest) throws Exception;
	public int boardDelete(int bno) throws Exception;
}
