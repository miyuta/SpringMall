package com.example.spring05.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.dao.BoardDAO;
import com.example.spring05.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
	}

	@Override
	public BoardVO boardView(int bno) throws Exception {
		return boardDao.boardView(bno);
	}

	@Override
	public int boardInsert(BoardVO insVO) throws Exception {
		return boardDao.boardInsert(insVO);
	}

	@Override
	public int boardModify(BoardVO modVO) throws Exception {
		return boardDao.boardModify(modVO);
	}

	@Override
	public int boardDelete(int bno) throws Exception {
		return boardDao.boardDelete(bno);
	}
}
