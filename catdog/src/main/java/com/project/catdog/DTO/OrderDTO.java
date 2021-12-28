package com.project.catdog.DTO;

import java.sql.Date;

public class OrderDTO {
	private String order_num;
	private String user_id;
	private String order_to;
	private String order_address;
	private String order_message;
	private int order_delivery;
	private int order_total;
	private String order_bankname;
	private String order_state;
	private Date order_date;
	
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(String order_num, String user_id, String order_to, String order_address, String order_message,
			int order_delivery, int order_total, String order_bankname, String order_state, Date order_date) {
		super();
		this.order_num = order_num;
		this.user_id = user_id;
		this.order_to = order_to;
		this.order_address = order_address;
		this.order_message = order_message;
		this.order_delivery = order_delivery;
		this.order_total = order_total;
		this.order_bankname = order_bankname;
		this.order_state = order_state;
		this.order_date = order_date;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOrder_to() {
		return order_to;
	}

	public void setOrder_to(String order_to) {
		this.order_to = order_to;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public String getOrder_message() {
		return order_message;
	}

	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}

	public int getOrder_delivery() {
		return order_delivery;
	}

	public void setOrder_delivery(int order_delivery) {
		this.order_delivery = order_delivery;
	}

	public int getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}

	public String getOrder_bankname() {
		return order_bankname;
	}

	public void setOrder_bankname(String order_bankname) {
		this.order_bankname = order_bankname;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
}
