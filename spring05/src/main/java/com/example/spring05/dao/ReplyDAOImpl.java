package com.example.spring05.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring05.model.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return sqlSession.selectList("reply.replyList", bno);
	}

	@Override
	public void replyWrite(ReplyVO rewrtVO) throws Exception {
		sqlSession.insert("reply.replyWrite", rewrtVO);
	}

	@Override
	public void replyModify(ReplyVO remodVO) throws Exception {
		sqlSession.update("reply.replyModify", remodVO);
	}

	@Override
	public void replyDelete(ReplyVO redelVO) throws Exception {
		sqlSession.delete("reply.replyDelete", redelVO);
	}

}
