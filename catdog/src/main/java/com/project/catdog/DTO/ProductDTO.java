package com.project.catdog.DTO;

import java.sql.Date;

public class ProductDTO {
	private String p_code;
	private String p_category;
	private String p_name;
	private int p_o_price;
	private int p_delivery;
	private int p_sale;
	private int p_a_price;
	private int p_stock;
	private int p_buy;
	private String p_content;
	private String p_mainimg;
	private String p_subimg;
	private Date p_date;
	
	public ProductDTO() {}

	public ProductDTO(String p_code, String p_category, String p_name, int p_o_price, int p_delivery, int p_sale,
			int p_a_price, int p_stock, int p_buy, String p_content, String p_mainimg, String p_subimg, Date p_date) {
		this.p_code = p_code;
		this.p_category = p_category;
		this.p_name = p_name;
		this.p_o_price = p_o_price;
		this.p_delivery = p_delivery;
		this.p_sale = p_sale;
		this.p_a_price = p_a_price;
		this.p_stock = p_stock;
		this.p_buy = p_buy;
		this.p_content = p_content;
		this.p_mainimg = p_mainimg;
		this.p_subimg = p_subimg;
		this.p_date = p_date;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_o_price() {
		return p_o_price;
	}

	public void setP_o_price(int p_o_price) {
		this.p_o_price = p_o_price;
	}

	public int getP_delivery() {
		return p_delivery;
	}

	public void setP_delivery(int p_delivery) {
		this.p_delivery = p_delivery;
	}

	public int getP_sale() {
		return p_sale;
	}

	public void setP_sale(int p_sale) {
		this.p_sale = p_sale;
	}

	public int getP_a_price() {
		return p_a_price;
	}

	public void setP_a_price(int p_a_price) {
		this.p_a_price = p_a_price;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public int getP_buy() {
		return p_buy;
	}

	public void setP_buy(int p_buy) {
		this.p_buy = p_buy;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_mainimg() {
		return p_mainimg;
	}

	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
	}

	public String getP_subimg() {
		return p_subimg;
	}

	public void setP_subimg(String p_subimg) {
		this.p_subimg = p_subimg;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	
}