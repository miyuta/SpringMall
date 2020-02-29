package com.example.spring04.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring04.modelDAO.ReplyDAO;
import com.example.spring04.modelVO.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replyDao;
	
	@Override
	public void replyInsert(ReplyVO repInsert) throws Exception {
		replyDao.replyInsert(repInsert);
	}
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return replyDao.replyList(bno);
	}
}
