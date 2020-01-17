package com.example.spring03.service;

import java.util.List;

import com.example.spring03.domain.CategoryVO;

public interface AdminService {
	public List<CategoryVO> category() throws Exception;
}
