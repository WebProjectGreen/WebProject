package com.project.catdog.Command;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class MyfageUserCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		//유저 정보 가져오기
		String user_id = request.getParameter("username");
		
		System.out.println("받아온 값");
		System.out.println("user_id : " + user_id);
		
		UserDTO dto = new UserDTO(user_id, null, null, null, null, null, null);
		System.out.println("유저 입력 DTO 저장");
		
		ArrayList<UserDTO> dtos = mdao.mypageUser(dto);
		request.setAttribute("result", dtos);
	}

}
