package com.example.spring05.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.spring05.dao.BoardDAO;
import com.example.spring05.model.BoardVO;
import com.example.spring05.model.PaginationVO;
import com.example.spring05.model.SearchVO;
import com.example.spring05.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
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
	public int countSch(SearchVO schVO) throws Exception {
		return boardDao.countSch(schVO);
	}
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
	}
	
	@Override
	public List<BoardVO> boardListPage(PaginationVO pageVO) throws Exception {
		return boardDao.boardListPage(pageVO);
	}
	
	@Override
	public List<BoardVO> boardListPageSch(SearchVO schVO) throws Exception {
		return boardDao.boardListPageSch(schVO);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public BoardVO boardView(int bno) throws Exception {
			boardDao.viewCnt(bno); 
			return boardDao.boardView(bno);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void boardWrite(BoardVO wrtVO, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDao.boardWrite(wrtVO);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(wrtVO, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			boardDao.uploadFile(list.get(i));
		}
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void boardModify(BoardVO modVO) throws Exception {
		boardDao.boardModify(modVO);
	}

	@Override
	public int boardDelete(int bno) throws Exception {
		return boardDao.boardDelete(bno);
	}
}
