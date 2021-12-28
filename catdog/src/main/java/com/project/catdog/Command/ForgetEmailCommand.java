package com.project.catdog.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class ForgetEmailCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		//���� �̸��� ��������
		String user_email = request.getParameter("email");
		System.out.println("user_email : " + user_email);
		
		UserDTO dto = new UserDTO(null, null, user_email, null, null, null, null);
		System.out.println("���� �Է� DTO ����");
		
		ArrayList<UserDTO> dtos = mdao.forgetEmail(dto);
		request.setAttribute("result", dtos);
	}

}
