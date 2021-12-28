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
		
		//유저 이메일 가져오기
		String user_email = request.getParameter("email");
		System.out.println("user_email : " + user_email);
		
		UserDTO dto = new UserDTO(null, null, user_email, null, null, null, null);
		System.out.println("유저 입력 DTO 저장");
		
		ArrayList<UserDTO> dtos = mdao.forgetEmail(dto);
		request.setAttribute("result", dtos);
	}

}
