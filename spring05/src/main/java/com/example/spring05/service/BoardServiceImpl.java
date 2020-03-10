package com.example.spring05.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.modelDAO.BoardDAO;
import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.PageMaker;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDao;
	
	@Override
	public void boardWrite(BoardVO insVO) throws Exception {
		boardDao.boardWrite(insVO);
	}
	
	@Override 
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
	}
	
	@Override
	public List<BoardVO> boardListPage(int startPost, int endPost) throws Exception {
		return boardDao.boardListPage(startPost, endPost);
	}
	
	@Override
	public List<BoardVO> boardListPageSch(PageMaker pageSchVO) throws Exception {
		return boardDao.boardListPageSch(pageSchVO);
	}
	
	@Override
	public BoardVO boardView(int bno) throws Exception {
		return boardDao.boardView(bno);
	}
	
	@Override
	public int passChk(BoardVO passChk) throws Exception {
		return boardDao.passChk(passChk);
	}
	
	@Override
	public void boardModify(BoardVO modVO) throws Exception {
		boardDao.boardModify(modVO);
	}
	
	@Override
	public void boardDelete(int bno) throws Exception {
		boardDao.boardDelete(bno);
	}
	
	@Override
	public int countAll() throws Exception {
		return boardDao.countAll();
	}
	
	@Override
	public int countSch(PageMaker pageSchVO) throws Exception {
		return boardDao.countSch(pageSchVO);
	}
}
