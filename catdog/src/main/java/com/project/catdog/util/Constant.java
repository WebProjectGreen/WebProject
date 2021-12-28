package com.project.catdog.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.project.catdog.DAO.MemberDAO;

public class Constant {
	public static MemberDAO mdao;
	public static BCryptPasswordEncoder passwordEncoder;
	public static String username;
}
