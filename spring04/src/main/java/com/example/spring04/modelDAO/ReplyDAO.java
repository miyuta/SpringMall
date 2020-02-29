package com.example.spring04.modelDAO;

import java.util.List;

import com.example.spring04.modelVO.ReplyVO;


public interface ReplyDAO {
	public void replyInsert(ReplyVO repInsert) throws Exception;
	public List<ReplyVO> replyList(int bno) throws Exception;
}
