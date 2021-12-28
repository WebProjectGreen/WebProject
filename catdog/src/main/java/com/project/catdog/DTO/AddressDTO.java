package com.project.catdog.DTO;

public class AddressDTO {
	private String user_id;
	private String address_to;
	private String zip_code;
	private String address_main;
	private String address_sub;
	private String message;
	
	public AddressDTO(String user_id, String address_to, String zip_code, String address_main, String address_sub,
			String message) {
		super();
		this.user_id = user_id;
		this.address_to = address_to;
		this.zip_code = zip_code;
		this.address_main = address_main;
		this.address_sub = address_sub;
		this.message = message;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAddress_to() {
		return address_to;
	}
	public void setAddress_to(String address_to) {
		this.address_to = address_to;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddress_main() {
		return address_main;
	}
	public void setAddress_main(String address_main) {
		this.address_main = address_main;
	}
	public String getAddress_sub() {
		return address_sub;
	}
	public void setAddress_sub(String address_sub) {
		this.address_sub = address_sub;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
