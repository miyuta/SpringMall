package com.example.spring05.modelVO;

import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class PageMaker {
	private int atPage;
	private int totalPost;
	private int perPagePost = 10;
	private int displayPageNum = 10;
	private int startPost;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	
	public void setAtPage(int atPage) {
		this.atPage = atPage;
	}
	
	public int getAtPage() {
		return atPage;
	}
	
	public int getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}

	public int getPerPagePost() {
		return perPagePost;
	}

	public int getStartPost() {
		return startPost = ((atPage - 1) * perPagePost) + 1;
	}

	public int getEndPost() {
		return startPost + perPagePost - 1;
	}

	public int getEndPage() {
		endPage = (int) (Math.ceil(atPage / (double) displayPageNum) * displayPageNum);
		int tempEndPage = (int) (Math.ceil(totalPost / (double) perPagePost));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		} return endPage;
	}
	
	public int getStartPage() {
		return startPage = (getEndPage() - displayPageNum) + 1;
	}
	
	public boolean isPrev() {
		return startPage == 1 ? false : true;
	}

	public boolean isNext() {
		return endPage * perPagePost >= totalPost ? false : true;
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
