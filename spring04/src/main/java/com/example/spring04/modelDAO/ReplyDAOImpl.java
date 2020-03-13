package com.example.spring04.modelDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring04.modelVO.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void replyInsert(ReplyVO repIns) throws Exception {
		sqlSession.insert("reply.replyInsert", repIns);
	}
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return sqlSession.selectList("reply.replyList", bno);
	}
	
	@Override
	public void replyModify(ReplyVO repMod) throws Exception {
		sqlSession.update("reply.replyModify", repMod);
	}
	
	@Override
	public void replyDelete(int bno) throws Exception {
		sqlSession.delete("reply.replyDelete", bno);
	}

}
