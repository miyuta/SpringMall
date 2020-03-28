package com.example.spring05.dao;

import java.util.List;

import com.example.spring05.model.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> replyList(int bno) throws Exception;
	public void replyWrite(ReplyVO rewrtVO) throws Exception;
	public void replyModify(ReplyVO remodVO) throws Exception;
	public void replyDelete(ReplyVO redelVO) throws Exception;
}
