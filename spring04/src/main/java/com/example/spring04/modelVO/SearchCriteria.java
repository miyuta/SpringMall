package com.example.spring04.modelVO;

public class SearchCriteria extends Criteria{
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
	
	@Override
	public String toString() {
		return "SearchCriteria [option=" + option + ", keyword=" + keyword + "]";
	}
}
