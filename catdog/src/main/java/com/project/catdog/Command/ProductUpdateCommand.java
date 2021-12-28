package com.project.catdog.Command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.util.Constant;

public class ProductUpdateCommand implements MainCommand {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		
		MemberDAO mdao = Constant.mdao;
		ProductDTO pdto = (ProductDTO)request.getAttribute("dto");
		
		System.out.println("========= 상품 정보 =========");
		System.out.println("상품코드 : " + pdto.getP_code());
		System.out.println("카테고리 : " + pdto.getP_category());
		System.out.println("이름 : " + pdto.getP_name());
		System.out.println("원가 : " + pdto.getP_o_price());
		System.out.println("배송료 : " + pdto.getP_delivery());
		System.out.println("할인율 : " + pdto.getP_sale());
		System.out.println("실제가격 : " + pdto.getP_a_price());
		System.out.println("정보 : " + pdto.getP_content());
		System.out.println("메인이미지 : " + pdto.getP_mainimg());
		System.out.println("서브이미지 : " + pdto.getP_subimg());
		System.out.println("===========================");
		
		String result = mdao.p_update(pdto);
		request.setAttribute("result", result);
	}

}
