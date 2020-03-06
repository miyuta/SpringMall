package com.example.spring05.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.modelDAO.BoardDAO;
import com.example.spring05.modelVO.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDao;
	
	@Override
	public void boardWrite(BoardVO insVO) throws Exception {
		boardDao.boardWrite(insVO);
	}
}
