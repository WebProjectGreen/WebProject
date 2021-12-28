package com.project.catdog.DTO;

public class CartDTO {
	private String p_code;
	private String user_id;
	private String cart_name;
	private int cart_price;
	private int cart_delivery;
	private int cart_sale;
	private int cart_ea;
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CartDTO(String p_code, String user_id, String cart_name, int cart_price, int cart_delivery, int cart_sale,
			int cart_ea) {
		super();
		this.p_code = p_code;
		this.user_id = user_id;
		this.cart_name = cart_name;
		this.cart_price = cart_price;
		this.cart_delivery = cart_delivery;
		this.cart_sale = cart_sale;
		this.cart_ea = cart_ea;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCart_name() {
		return cart_name;
	}
	public void setCart_name(String cart_name) {
		this.cart_name = cart_name;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public int getCart_delivery() {
		return cart_delivery;
	}
	public void setCart_delivery(int cart_delivery) {
		this.cart_delivery = cart_delivery;
	}
	public int getCart_sale() {
		return cart_sale;
	}
	public void setCart_sale(int cart_sale) {
		this.cart_sale = cart_sale;
	}
	public int getCart_ea() {
		return cart_ea;
	}
	public void setCart_ea(int cart_ea) {
		this.cart_ea = cart_ea;
	}
	
}
