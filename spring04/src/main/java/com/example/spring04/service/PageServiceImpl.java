package com.example.spring04.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class PageServiceImpl implements PageService {
	
	@Override
	public Map<String, Integer> pagingMaker(int totalRowCount, int atPage) throws Exception {
	
	//한 페이지에 출력 할 게시물 갯수
	int perPageRow = 10;
	//게시물 총 갯수
	//int totlaRowCount;
	//현재 페이지
	//int atPage = num;
	//하단 페이지 번호 (게시물 총 갯수 / 한 페이지에 출력 할 게수물 갯수)의 올림 ex 100 / 10 = 10  1번 페이지부터 10번 페이지까지
	int pageNum = (int)Math.ceil((double)totalRowCount/perPageRow);
	//출력 할 게시물 첫 번호
	int startRow = (atPage - 1) * perPageRow + 1;
	//출력 할 게시물 끝 번호
	int endRow = atPage * perPageRow;
	//한번에 표시할 페이지 번호 수
	int pageNumRange = 10;
	//표시되는 마지막 페이지 번호(10단위로 끊김 게시물 갯수에 따라 마지막 번호가 남음)
	int endPageNum = (int)(Math.ceil((double)atPage / (double)pageNumRange) * pageNumRange);
	//표시되는 페이지 처음 번호
	int startPageNum = endPageNum - (pageNumRange - 1);
	//표시되는 마지막 페이지 번호 비교(1단위로 끊김)
	int endPageNum_tmp = (int)Math.ceil((double)totalRowCount/(double)pageNumRange);
	
	//10단위가 1단위보다 크면 1단위를 표시
	if (endPageNum > endPageNum_tmp) {
		endPageNum = endPageNum_tmp;
	}
	Map<String, Integer> map = new HashMap<>();
	map.put("pageNum", pageNum);
	map.put("startRow", startRow);
	map.put("endRow", endRow);
	map.put("endPageNum", endPageNum);
	map.put("startPageNum", startPageNum);
	map.put("pageNumRange", pageNumRange);
	map.put("atPage", atPage);
	
	return map;
	}
}
