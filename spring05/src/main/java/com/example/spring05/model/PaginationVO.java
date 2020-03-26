package com.example.spring05.model;

public class PaginationVO {
	
	private int atPage;				//현재 페이지
	private int perPagePost;	//한 페이지 글 수
	private int startPost;			//글 시작 번호(RNUM)
	private int endPost;			//글 끝 번호(RNUM)
	
	// 생성자
	public PaginationVO() {
		this.atPage = 1;
		this.perPagePost = 10;
	}
	
	public int getAtPage() {
		return atPage;
	}
	public void setAtPage(int atPage) {
		if (atPage <= 0) {
			this.atPage = 1;
			return;
		}
		this.atPage = atPage;
	}
	public int getPerPagePost() {
		return perPagePost;
	}
	public void setPerPagePost(int perPagePost) {
		if (perPagePost <= 0 || perPagePost > 100) {
			this.perPagePost = 10;
			return;
		}
		this.perPagePost = perPagePost;
	}
	public int getStartPost() {
		startPost = ((atPage - 1) * perPagePost) + 1;
		return startPost;
	}
	public int getEndPost() {
		endPost = startPost + perPagePost - 1;
		return endPost;
	}
	
	@Override
	public String toString() {
		return "PaginationVO [atPage=" + atPage + ", perPagePost=" + perPagePost + ", startPost=" + startPost
				+ ", endPost=" + endPost + "]";
	}
}
