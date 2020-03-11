package com.example.spring04.modelVO;

public class Criteria {
	private int atPage;
	private int perPagePost;
	private int startPost;
	private int endPost;
	
	public Criteria() {
		this.atPage = 1;
		this.perPagePost = 10;
	}
	
	public void setAtPage(int atPage) {
		if(atPage <= 0) {
			this.atPage = 1;
			return;
		}
		this.atPage = atPage;
	}
	
	public void setPerPagePost(int perPagePost) {
		if(perPagePost <= 0 || perPagePost > 100) {
			this.perPagePost = 10;
			return;
		}
		this.perPagePost = perPagePost;
	}
	
	public int getAtPage() {
		return atPage;
	}
	
//	public int getStartPost () {
//		return (this.atPage - 1) * perPagePost;
//	}
	
	public int getPerPagePost() {
		return this.perPagePost;
	}
	
	public int getStartPost() {
		startPost = ((atPage - 1) * perPagePost) + 1;
		return startPost;
	}
	
	public int getEndPost() {
		endPost = startPost + perPagePost -1;
		return endPost;
	}

	@Override
	public String toString() {
		return "Criteria [atPage=" + atPage + ", perPagePost=" + perPagePost + ", startPost=" + startPost + ", endPost="
				+ endPost + "]";
	}
}
