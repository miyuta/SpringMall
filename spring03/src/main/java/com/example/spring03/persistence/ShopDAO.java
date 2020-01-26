package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.ReplyListVO;
import com.example.spring03.domain.ReplyVO;

public interface ShopDAO {
	public List<GoodsViewVO> shopList(int catecode) throws Exception;
	public List<GoodsViewVO> shopList(int catecode, int catecoderef) throws Exception;
	public GoodsViewVO shopView(int gdsnum) throws Exception;
	public void replyInsert(ReplyVO rep_insVO) throws Exception;
	public List<ReplyListVO> replyList(int gdsnum) throws Exception;
	public void replyDelete(ReplyVO rep_delVO) throws Exception;
	public String replyIdCheck(int gdsnum) throws Exception;
	public void replyModify(ReplyVO rep_upVO) throws Exception;
}
