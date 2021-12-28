package com.project.catdog.DTO;

public class OrderlistDTO {
	private String user_id;
	private String sort;
	private String state;
	private String orderby;
	
	public OrderlistDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderlistDTO(String user_id, String sort, String state, String orderby) {
		super();
		this.user_id = user_id;
		this.sort = sort;
		this.state = state;
		this.orderby = orderby;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	
}
