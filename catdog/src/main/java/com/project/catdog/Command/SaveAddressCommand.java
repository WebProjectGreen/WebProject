package com.project.catdog.Command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.AddressDTO;
import com.project.catdog.util.Constant;

public class SaveAddressCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		
		String user_id = userDetails.getUsername();
		String address_to = request.getParameter("address_to");
		String zip_code = request.getParameter("zip_code");
		String address_main = request.getParameter("address_main");
		String address_sub = request.getParameter("address_sub");
		String message = request.getParameter("message");
		
		AddressDTO dto = new AddressDTO(user_id, address_to, zip_code, address_main, address_sub, message);
		int search = mdao.selectAddress(dto);
		
		if(search > 0) {
			mdao.saveAddress_update(dto);
		} else {
			mdao.saveAddress_insert(dto);
		}
	}

}
