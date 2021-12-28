package com.project.catdog.Command;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class ForgetUserCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		//���� �̸�, ���� ��������
		String user_name = request.getParameter("user_name");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		String date = year + "-" + month + "-" + day;
		Date user_birth = Date.valueOf(date);
		
		System.out.println("�޾ƿ� ��");
		System.out.println("user_name : " + user_name);
		System.out.println("user_birth : " + date);
		
		UserDTO dto = new UserDTO(null, null, null, user_name, user_birth, null, null);
		System.out.println("���� �Է� DTO ����");
		
		ArrayList<UserDTO> dtos = mdao.forgetUser(dto);
		request.setAttribute("result", dtos);
	}

}
