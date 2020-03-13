package com.example.spring04.service;

import java.util.List;

import com.example.spring04.modelVO.ReplyVO;

public interface ReplyService {
	public void replyInsert(ReplyVO repIns) throws Exception;
	public List<ReplyVO> replyList(int bno) throws Exception;
	public void replyModify(ReplyVO repMod) throws Exception;
	public void replyDelete(int bno) throws Exception;
}
