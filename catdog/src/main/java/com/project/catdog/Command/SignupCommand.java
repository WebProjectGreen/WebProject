package com.project.catdog.Command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class SignupCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_email = request.getParameter("user_email");
		String user_name = request.getParameter("user_name");
		String user_sex = request.getParameter("user_sex");
		Date user_birth = null;
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		//����Ʈ��, �Է°� �ĺ�
		if(!(year.equals("0000")) && !(month.equals("00")) && !(day.equals("00"))) {
			String date = year + "-" + month + "-" + day;
			user_birth = Date.valueOf(date);
		} else {
			//String date = "0001-01-01"; //����Ʈ��
			user_birth = null;
		}
		
		//�н����� ��ȣȭ
		String org_pw = user_pw;
		user_pw = passwordEncoder.encode(org_pw);
		System.out.println("��ȣȭ�� pw : " + user_pw);
		System.out.println("length : " + user_pw.length());
		
		UserDTO dto = new UserDTO(user_id, user_pw, user_email, user_name, user_birth, user_sex, null);
		
		String result = mdao.signup(dto);
		request.setAttribute("data", result);
	}

}
