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
	public void replyWrite(ReplyVO rewrtVO) throws Exception {
		replyDao.replyWrite(rewrtVO);
	}

	@Override
	public void replyModify(ReplyVO remodVO) throws Exception {
		replyDao.replyModify(remodVO);
	}

	@Override
	public void replyDelete(ReplyVO redelVO) throws Exception {
		replyDao.replyDelete(redelVO);
	}

}
