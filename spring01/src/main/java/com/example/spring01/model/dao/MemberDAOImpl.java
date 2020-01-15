package com.example.spring01.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MemberDTO> MemberList() {
		return sqlSession.selectList("member.list");
	}

	@Override
	public void inserMember(MemberDTO vo) {
		sqlSession.insert("member.insert", vo);
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.view", userid);
	}

	@Override
	public void deleteMember(String userid) {
		sqlSession.delete("member.delete", userid);
	}

	@Override
	public void updateMember(MemberDTO vo) {
		sqlSession.update("member.update", vo);
	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		boolean result = false;
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.checkPw", map);
		if(count == 1) result=true;
		return result;
	}

}
