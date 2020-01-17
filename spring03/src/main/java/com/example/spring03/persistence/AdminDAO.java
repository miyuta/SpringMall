package com.example.spring03.persistence;

import java.util.List;

import com.example.spring03.domain.CategoryVO;


public interface AdminDAO {
	public List<CategoryVO> category() throws Exception;
}
