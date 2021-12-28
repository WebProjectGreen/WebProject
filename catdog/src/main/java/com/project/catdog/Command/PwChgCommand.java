package com.project.catdog.Command;


import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class PwChgCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		String user_id = (String)request.getAttribute("user_id");
		String user_pw = request.getParameter("user_pw");
		
		//패스워드 암호화
		String org_pw = user_pw;
		user_pw = passwordEncoder.encode(org_pw);
		System.out.println("암호화된 pw : " + user_pw);
		System.out.println("length : " + user_pw.length());
		
		UserDTO dto = new UserDTO(user_id, user_pw, null, null, null, null, null);
		
		String result = mdao.pwChgUp(dto);
		request.setAttribute("data", result);
	}

}
