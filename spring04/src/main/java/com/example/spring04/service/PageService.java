package com.example.spring04.service;

import java.util.Map;

public interface PageService {
	public Map<String, Integer> pagingMaker(int totalRowCount, int atPage) throws Exception;
}
