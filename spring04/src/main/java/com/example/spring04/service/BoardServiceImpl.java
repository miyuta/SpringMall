package com.example.spring04.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.spring04.modelDAO.BoardDAO;
import com.example.spring04.modelVO.BoardVO;
import com.example.spring04.modelVO.Criteria;
import com.example.spring04.modelVO.SearchCriteria;
import com.example.spring04.utils.FileUtils;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private BoardDAO boardDao;
	
	@Override
	public void boardWrite(BoardVO wrtVO, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDao.boardWrite(wrtVO);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(wrtVO, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			boardDao.insertFile(list.get(i));
		}
	}
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
	}
	
	@Override
	public List<BoardVO> boardListPage(int startRow, int endRow) throws Exception {
		return boardDao.boardListPage(startRow, endRow);
	}
	
	@Override
	public int listCount() throws Exception {
		return boardDao.listCount();
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
	public void boardUpdate(BoardVO updVO) throws Exception {
		boardDao.boardUpdate(updVO);
	}
	
	@Override
	public void boardDelete(int seq) throws Exception {
		boardDao.boardDelete(seq);
	}
	
	@Override
	public List<BoardVO> boardListSchPage(String option, String keyword, int startRow, int endRow) throws Exception {
		BoardVO SchPage = new BoardVO();
		SchPage.setOption(option);
		SchPage.setKeyword(keyword);
		SchPage.setStartRow(startRow);
		SchPage.setEndRow(endRow);
		
		return boardDao.boardListSchPage(SchPage);
	}
	
	@Override
	public int boardSelCount(String option, String keyword) throws Exception {
		return boardDao.boardSelCount(option, keyword);
	}
	
	
	@Override
	public List<BoardVO> ListPage(Criteria cri) throws Exception {
		return boardDao.ListPage(cri);
	}
	
	@Override
	public List<BoardVO> ListSchPage(SearchCriteria scri) throws Exception {
		return boardDao.ListSchPage(scri);
	}
}
