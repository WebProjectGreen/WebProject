package com.project.catdog.Command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.Criteria;
import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.PageMakerDTO;
import com.project.catdog.DTO.ProductCountDTO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.DTO.ProductlistDTO;
import com.project.catdog.util.Constant;

public class ProductlistCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		
		MemberDAO mdao = Constant.mdao;
		
		Map<String, Object> map = model.asMap();
		
		String sName = request.getParameter("sName");
		String category = request.getParameter("category");
		String sort1 = request.getParameter("sort1");
		String sort2 = request.getParameter("sort2");

		if(!(map.isEmpty())) {
			category = (String)map.get("category");
			sort1 = (String)map.get("sort1");
			sort2 = (String)map.get("sort2");
		}
		
		if(sName == null) {
			sName = "%%";
		}
		if(!(sName.equals(""))) {
			sName = "%" + sName + "%";
		} else {
			sName = "%%";
		}
		
		ProductCountDTO dtoc = mdao.productCount();
		
		Criteria cri = new Criteria(1, 5);
		ProductlistDTO list = new ProductlistDTO(sName, category, sort1, sort2, cri);
		int resultcount = mdao.productlistCount(list);
		System.out.println("resultcount : " + resultcount);
		PageMakerDTO pmdto = new PageMakerDTO(cri, resultcount);
		
		ProductlistDTO dto = new ProductlistDTO(sName, category, sort1, sort2, cri);
		ArrayList<ProductDTO> dtos = mdao.productlist(dto);
		
		request.setAttribute("page", pmdto);
		request.setAttribute("result", dtos);
		request.setAttribute("count", dtoc);
	}

}
