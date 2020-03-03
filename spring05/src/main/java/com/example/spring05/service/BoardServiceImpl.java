package com.example.spring05.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.modelDAO.BoardDAO;
import com.example.spring05.modelVO.BoardVO;
import com.example.spring05.modelVO.Criteria;
import com.example.spring05.modelVO.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDao;

	@Override
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
	}
	
	@Override
	public List<BoardVO> boardListPage(Criteria criteria) throws Exception {
		return boardDao.boardListPage(criteria);
	}
	
	@Override
	public int countAll() throws Exception {
		return boardDao.countAll();
	}

	@Override
	public void boardWrite(BoardVO insVO) throws Exception {
		boardDao.boardWrite(insVO);
	}

	@Override
	public BoardVO boardView(int seq) throws Exception {
		return boardDao.boardView(seq);
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
	public void boardDelete(int seq) throws Exception {
		boardDao.boardDelete(seq);
	}
	
	@Override
	public List<BoardVO> boardListSch(SearchVO schVO) throws Exception {
		return boardDao.boardListSch(schVO);
	}
	
	@Override
	public int countSch(SearchVO schCntVO) throws Exception {
		return boardDao.countSch(schCntVO);
	}
}
