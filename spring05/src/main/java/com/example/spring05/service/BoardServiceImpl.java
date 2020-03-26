package com.example.spring05.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.spring05.dao.BoardDAO;
import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;
	
	@Override
	public String passChk(int bno) throws Exception {
		return boardDao.passChk(bno);
	}
	
	@Override
	public int countAll() throws Exception {
		return boardDao.countAll();
	}
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
	}
	
	@Override
	public List<BoardVO> boardListPage(PaginationVO pageVO) throws Exception {
		return boardDao.boardListPage(pageVO);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public BoardVO boardView(int bno) throws Exception {
			boardDao.viewCnt(bno); 
			return boardDao.boardView(bno);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void boardWrite(BoardVO wrtVO) throws Exception {
		boardDao.boardWrite(wrtVO);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardModify(BoardVO modVO) throws Exception {
		return boardDao.boardModify(modVO);
	}

	@Override
	public int boardDelete(int bno) throws Exception {
		return boardDao.boardDelete(bno);
	}
}
