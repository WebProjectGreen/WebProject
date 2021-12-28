package com.project.catdog.DTO;

import com.project.catdog.Criteria;

public class PageMakerDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next;
	private int total;
	private Criteria cri; //���� ������, �������� �Խù� ǥ�ü� ����
	
	//������
	public PageMakerDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//������ ������ (������������ 7�ΰ�� 10, 23�ΰ�� 30�� ��ȯ)
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		//���� ������
		this.startPage = this.endPage - 9;
		//��ü ������ ������
		this.realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
		
		//��ü ������ ������(realEnd)�� ȭ�鿡 ���̴� ������������(endPage)���� ���� ���, ���̴� ������(endPage) �� ����
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//���� ������(startPage)���� 1���� ū ��� true
		this.prev = this.startPage > 1;
		
		//������ ������(endPage)���� 1���� ū ��� true
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
