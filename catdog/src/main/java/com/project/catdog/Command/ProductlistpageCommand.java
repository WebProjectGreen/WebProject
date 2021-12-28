package com.project.catdog.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.Criteria;
import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.PageMakerDTO;
import com.project.catdog.DTO.ProductCountDTO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.DTO.ProductlistDTO;
import com.project.catdog.util.Constant;

public class ProductlistpageCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		MemberDAO mdao = Constant.mdao;
		
		String sName = request.getParameter("sName");
		String category = request.getParameter("category");
		String sort1 = request.getParameter("sort1");
		String sort2 = request.getParameter("sort2");
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println("페이지 : " + page);
		
		if(sName == null) {
			sName = "%%";
		}
		if(!(sName.equals(""))) {
			sName = "%" + sName + "%";
		} else {
			sName = "%%";
		}
		
		ProductCountDTO dtoc = mdao.productCount();
		
		Criteria cri = new Criteria(page, 5);
		ProductlistDTO list = new ProductlistDTO(sName, category, sort1, sort2, cri);
		int resultcount = mdao.productlistCount(list);
		System.out.println("resultcount : " + resultcount);
		PageMakerDTO pmdto = new PageMakerDTO(cri, resultcount);
		
		ProductlistDTO dto = new ProductlistDTO(sName, category, sort1, sort2, cri);
		ArrayList<ProductDTO> dtos = mdao.productlist(dto);
		
		//항목없을시 첫페이지 이동
		if(dtos.isEmpty()) {
			cri = new Criteria(1, 5);
			pmdto = new PageMakerDTO(cri, resultcount);
			dto = new ProductlistDTO(sName, category, sort1, sort2, cri);
			dtos = mdao.productlist(dto);
		}
		
		request.setAttribute("page", pmdto);
		request.setAttribute("result", dtos);
		request.setAttribute("count", dtoc);
	}

}
