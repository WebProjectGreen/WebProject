package com.project.catdog.DTO;

import com.project.catdog.Criteria;

public class ProductlistDTO {
	private String sName;
	private String category;
	private String sort1;
	private String sort2;
	private Criteria cri;
	private int rowStart;
	private int rowEnd;
	
	public ProductlistDTO() {}

	public ProductlistDTO(String sName, String category, String sort1, String sort2, Criteria cri) {
		this.sName = sName;
		this.category = category;
		this.sort1 = sort1;
		this.sort2 = sort2;
		this.cri = cri;
		this.rowStart = ((cri.getPageNum() - 1) * cri.getAmount()) + 1;
		this.rowEnd = this.rowStart + cri.getAmount() - 1;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSort1() {
		return sort1;
	}

	public void setSort1(String sort1) {
		this.sort1 = sort1;
	}

	public String getSort2() {
		return sort2;
	}

	public void setSort2(String sort2) {
		this.sort2 = sort2;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getRowStart() {
		return rowStart;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getRowEnd() {
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	
}
