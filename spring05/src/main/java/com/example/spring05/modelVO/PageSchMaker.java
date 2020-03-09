package com.example.spring05.modelVO;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class PageSchMaker {
	private String option;
	private String keyword;
	
	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Map<String, Integer> pagiNation(int atPage, int totalPost) throws Exception {
		int perPagePost = 10;
		int displayPageNum = 10;
		int startPost = ((atPage - 1) * perPagePost) + 1;
		int endPost = startPost + perPagePost - 1;
		int endPage = (int) (Math.ceil(atPage / (double) displayPageNum) * displayPageNum);
		int startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalPost / (double) perPagePost));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		int prev = startPage == 1 ? 1 : 0;
		int next = endPage * perPagePost >= totalPost ? 1 :0;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPost", startPost);
		map.put("endPost", endPost);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		
		return map;
	}
	
	public String makeQuery(int atPage) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
														.queryParam("atPage", atPage)
														.queryParam("perPagePost", 10)
														.build();
		
		return uriComponents.toString();
	}
}
