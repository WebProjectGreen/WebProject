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
		
		System.out.println("========= ��ǰ ���� =========");
		System.out.println("��ǰ�ڵ� : " + pdto.getP_code());
		System.out.println("ī�װ� : " + pdto.getP_category());
		System.out.println("�̸� : " + pdto.getP_name());
		System.out.println("���� : " + pdto.getP_o_price());
		System.out.println("��۷� : " + pdto.getP_delivery());
		System.out.println("������ : " + pdto.getP_sale());
		System.out.println("�������� : " + pdto.getP_a_price());
		System.out.println("���� : " + pdto.getP_content());
		System.out.println("�����̹��� : " + pdto.getP_mainimg());
		System.out.println("�����̹��� : " + pdto.getP_subimg());
		System.out.println("===========================");
		
		String result = mdao.p_update(pdto);
		request.setAttribute("result", result);
	}

}
