package com.project.catdog.DTO;

import com.project.catdog.Criteria;

public class PageMakerDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next;
	private int total;
	private Criteria cri; //현재 페이지, 페이지당 게시물 표시수 정보
	
	//생성자
	public PageMakerDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//마지막 페이지 (현재페이지가 7인경우 10, 23인경우 30을 반환)
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		//시작 페이지
		this.startPage = this.endPage - 9;
		//전체 마지막 페이지
		this.realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
		
		//전체 마지막 페이지(realEnd)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//시작 페이지(startPage)값이 1보다 큰 경우 true
		this.prev = this.startPage > 1;
		
		//마지막 페이지(endPage)값이 1보다 큰 경우 true
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getRealEnd() {
		return realEnd;
	}

	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}
	
}
