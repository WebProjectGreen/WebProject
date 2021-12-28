package com.project.catdog;

public class Criteria {
	private int pageNum; //현재 페이지
	private int amount; //한 페이지당 보여질 개시물 수
	
	public Criteria() {
		this(1,5);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
