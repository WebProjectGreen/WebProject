package com.project.catdog.DTO;

public class OrderItemDTO {
	private String order_num;
	private String p_code;
	private int order_price;
	private int order_stock;
	
	public OrderItemDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderItemDTO(String order_num, String p_code, int order_price, int order_stock) {
		super();
		this.order_num = order_num;
		this.p_code = p_code;
		this.order_price = order_price;
		this.order_stock = order_stock;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public int getOrder_stock() {
		return order_stock;
	}

	public void setOrder_stock(int order_stock) {
		this.order_stock = order_stock;
	}
	
}
