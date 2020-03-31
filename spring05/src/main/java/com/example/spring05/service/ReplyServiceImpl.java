package com.example.spring05.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring05.dao.ReplyDAO;
import com.example.spring05.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDao;
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return replyDao.replyList(bno);
	}

	@Override
	public void replyWrite(ReplyVO reWrtVO) throws Exception {
		replyDao.replyWrite(reWrtVO);
	}
	
	@Override
	public ReplyVO replyView(ReplyVO reViewVO) throws Exception {
		return replyDao.replyView(reViewVO);
	}

	@Override
	public void replyModify(ReplyVO reModVO) throws Exception {
		replyDao.replyModify(reModVO);
	}

	@Override
	public void replyDelete(ReplyVO reDelVO) throws Exception {
		replyDao.replyDelete(reDelVO);
	}

}
