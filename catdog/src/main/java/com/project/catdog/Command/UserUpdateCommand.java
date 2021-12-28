package com.project.catdog.Command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class UserUpdateCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		String user_id = (String)request.getAttribute("user_id");
		String user_name = request.getParameter("user_name");
		String user_sex = request.getParameter("user_sex");
		Date user_birth = null;
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		//디폴트값, 입력값 식별
		if(!(year.equals("0000")) && !(month.equals("00")) && !(day.equals("00"))) {
			String date = year + "-" + month + "-" + day;
			user_birth = Date.valueOf(date);
		} else {
			user_birth = null;
		}
		
		UserDTO dto = new UserDTO(user_id, null, null, user_name, user_birth, user_sex, null);
		
		String result = mdao.userUpdate(dto); //signup userUpdate
		request.setAttribute("data", result);
	}

}
