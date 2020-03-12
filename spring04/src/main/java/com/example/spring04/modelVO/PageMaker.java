package com.example.spring04.modelVO;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalPost;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	private Criteria cri;
	
	public void setCri(Criteria cri) {
		this.cri= cri;
	}
	
	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
		calcData();
	}
	
	public Criteria getCri() {
		return cri;
	}
	
	public int getTotalPost() {
		return totalPost;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDispalyPageNum() {
		return displayPageNum;
	}
	
	private void calcData() {
		endPage = (int)(Math.ceil(cri.getAtPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalPost / (double)cri.getPerPagePost()));
		if (endPage > tempEndPage) endPage = tempEndPage;
		prev = startPage == 1 ? false :true;
		next = endPage * cri.getPerPagePost() >= totalPost ? false : true;
		}
	
	public String makeQuery(int atPage) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
													.queryParam("atPage", atPage)
													.queryParam("perPagePost", cri.getPerPagePost())
													.build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int atPage) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
														.queryParam("atPage", atPage)
														.queryParam("perPagePost", cri.getPerPagePost())
														.queryParam("option", ((SearchCriteria)cri).getOption())
														.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
														.build();
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) return "";
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
