package com.example.spring05.modelVO;

public class Criteria {
	private int atPage;
	private int perPagePost;
	private int StartPost;
	private int endPost;
	
	public Criteria() 
	{
		this.atPage = 1;
		this.perPagePost = 10;
	}
	
	public void setAtPage(int atPage)
	{
		if (atPage <= 0)
		{
			this.atPage = 1;
			return;
		}
		this.atPage = atPage;
	}
	
	public void setPerPagePost(int perPagePost)
	{
		if (perPagePost <= 0 || perPagePost > 100)
		{
			this.perPagePost = 10;
			return;
		}
		this.perPagePost = perPagePost;
	}
	
	public int getAtPage()
	{
		return atPage;
	}
	
	public int getPageStart()
	{
		return (this.atPage -1) * perPagePost;
	}
	
	public int getPerPagePost()
	{
		return this.perPagePost;
	}
	public int getStartPost() 
	{
		StartPost =((atPage - 1) * perPagePost) + 1;
		return StartPost;
	}
	
	public int getEndPost() {
		endPost = StartPost + perPagePost - 1;
		return endPost;
	}
	
	 @Override
	 public String toString() {
	  return "Criteria [atPage=" + atPage + ", perPagePost=" + perPagePost + ""
	    + ", StartPost=" +  getStartPost() + ", endPost=" + getEndPost()
	    + "]";
	 }
}
