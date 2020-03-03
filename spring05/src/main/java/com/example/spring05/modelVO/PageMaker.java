 	package com.example.spring05.modelVO;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum =10;
	
	private Criteria criteria;
	
	public void setCriteria(Criteria criteria)
	{
		this.criteria = criteria;
	}
	
	public void setTotalCount(int totalCount)
	{
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount()
	{
		return totalCount;
	}
	
	public int getStartPage()
	{
		return startPage;
	}
	
	public int getEndPage()
	{
		return endPage;
	}
	
	public boolean isPrev()
	{
		return prev;
	}
	
	public boolean isNext()
	{
		return next;
	}
	
	public int getDisplyPageNum()
	{
		return displayPageNum;
	}
	
	public Criteria getCriteria()
	{
		return criteria;
	}
	
	private void calcData()
	{
		endPage = (int) (Math.ceil(criteria.getAtPage() / (double)displayPageNum) * displayPageNum);		//올림(현재 페이지 / 표시 페이지 번호 수) * 표시 페이지 번호
		startPage = (endPage - displayPageNum) + 1;		//(마지막 번호 - 표시 페이지 번호 수) + 1
	
	int realEndPage = (int) (Math.ceil(totalCount / (double)criteria.getPerPagePost()));		//실제 마지막 번호: 올림(전체 게시글 / 한 페이지 표시 게시글)	
	if (endPage > realEndPage) 		//마지막 페이지 번호가 실제 마직막 페이지 번호보다 더 클 때 실제 마지막 페이지 번호로 설정
	{
		endPage = realEndPage;
	}
	prev = startPage == 1 ? false : true;		//시작 번호가 1이면 표시 안함
	next = endPage * criteria.getPerPagePost() >= totalCount ? false : true;		//마지막 번호가 마지막 페이지번호 * 한 페이지 표시 게시물이 총 게시물보다 크거나 같을 때 표시 안함
	}
	
	public String makeQuery(int atPage)
	{
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("atPage", atPage)
				.queryParam("perPagePost", criteria.getPerPagePost())
				.build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int atPage)
	{
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("atPage", atPage)
				.queryParam("perPagePost", criteria.getPerPagePost())
				.queryParam("searchType", ((SearchVO)criteria).getSearchType())
				.queryParam("keyword", encoding(((SearchVO)criteria).getKeyword()))
				.build();
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}		
	}
}
