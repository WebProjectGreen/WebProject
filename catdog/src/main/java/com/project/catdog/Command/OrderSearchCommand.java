package com.project.catdog.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.OrderDTO;
import com.project.catdog.DTO.OrderlistDTO;
import com.project.catdog.util.Constant;

public class OrderSearchCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		String user_id = request.getParameter("user_id");
		String sort = request.getParameter("sort");
		String state = request.getParameter("state");
		String orderby = request.getParameter("orderby");
		
		if(user_id == null) {
			user_id = "%%";
		}
		if(!(user_id.equals(""))) {
			user_id = "%" + user_id + "%";
		} else {
			user_id = "%%";
		}
		
		OrderlistDTO dto = new OrderlistDTO(user_id, sort, state, orderby);
		ArrayList<OrderDTO> dtos = mdao.order_search(dto);
		request.setAttribute("result", dtos);
	}

}
