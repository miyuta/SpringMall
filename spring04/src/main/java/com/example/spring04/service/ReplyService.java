package com.example.spring04.service;

import java.util.List;

import com.example.spring04.modelVO.ReplyVO;

public interface ReplyService {
	public void replyInsert(ReplyVO repInser) throws Exception;
	public List<ReplyVO> replyList(int bno) throws Exception;
}
