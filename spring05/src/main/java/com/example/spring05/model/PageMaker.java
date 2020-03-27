package com.example.spring05.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalPost;								//총 게시물 수
	private int startPage;								//시작 페이지 번호
	private int endPage;								// 끝 페이지 번호
	private boolean prev;							//앞으로
	private boolean next;							//뒤로
	private int displayPage = 10;		//보여지는 페이지 수
	private PaginationVO pageVO;
	
	public void setPageVO(PaginationVO pageVO) {
		this.pageVO = pageVO;
	}
	
	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
		calcData();
	}
	
	public PaginationVO getPageVO() {
		return pageVO;
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
	
	public void calcData() {
		endPage = (int)(Math.ceil(pageVO.getAtPage() / (double) displayPage) * displayPage);
		startPage = (endPage - displayPage) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalPost / (double) pageVO.getPerPagePost()));
		if  (endPage > tempEndPage) {
			endPage = tempEndPage;		//마지막 페이지가 실제 마지막 페이지보다 크면 실제 마지막 페이지 세팅
		}
		prev = startPage == 1 ? false : true;
		next = endPage * pageVO.getPerPagePost() >= totalPost ? false : true;		//마지막 페이지 * 표시 페이지 수가 총 게시글 수 보다 크거나 작으면 표시안함
	}
	
	public String makeQuery(int atPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
																  .queryParam("atPage", atPage)
																  .queryParam("perPagePost", pageVO.getPerPagePost())
																  .build();
		return uriComponents.toString();
	}
	
	public String makeSearch(int atPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
																  .queryParam("atPage", atPage)
																  .queryParam("perPagePost", pageVO.getPerPagePost())
																  .queryParam("option", (((SearchVO)pageVO).getOption()))
																  .queryParam("keyword", encoding(((SearchVO)pageVO).getKeyword()))
																  .build();
		return uriComponents.toString();
	}
	
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return null;
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return null;
		}
	}
}
