package com.project.catdog.DTO;

import java.sql.Date;

public class UserDTO {
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_name;
	private Date user_birth;
	private String user_sex;
	private Date user_since;
	
	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String user_id, String user_pw, String user_email, String user_name, Date user_birth,
			String user_sex, Date user_since) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_sex = user_sex;
		this.user_since = user_since;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public Date getUser_since() {
		return user_since;
	}

	public void setUser_since(Date user_since) {
		this.user_since = user_since;
	}

}