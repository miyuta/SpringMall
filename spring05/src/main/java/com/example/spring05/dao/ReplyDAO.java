package com.example.spring05.dao;

import java.util.List;

import com.example.spring05.model.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> replyList(int bno) throws Exception;
	public void replyWrite(ReplyVO reWrtVO) throws Exception;
	public ReplyVO replyView(ReplyVO reViewVO) throws Exception;
	public void replyModify(ReplyVO reModVO) throws Exception;
	public void replyDelete(ReplyVO reDelVO) throws Exception;
}
