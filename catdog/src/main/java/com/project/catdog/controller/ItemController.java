package com.project.catdog.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.catdog.Criteria;
import com.project.catdog.Command.MainCommand;
import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.DTO.ProductlistDTO;
import com.project.catdog.util.Constant;

@Controller
public class ItemController {
	
	private MemberDAO mdao;
	@Autowired
	public void setMdao(MemberDAO mdao) {
		this.mdao = mdao;
		Constant.mdao = mdao;
	}
	
	@Autowired
	PlatformTransactionManager transactionManager;
	public void setTransactionManager(PlatformTransactionManager transactionmanager) {
		this.transactionManager = transactionmanager;
	}
	
	private MainCommand mcom;
	
	@RequestMapping("/item")
	public String item(@RequestParam(value = "category") String category,
					   @RequestParam(value = "sort") String sort,
					   HttpServletRequest request) {
		System.out.println("상품정렬 시작");
		System.out.println("카테고리 : " + category);
		System.out.println("정렬 : " + sort);
		
		if(category.equals("fashion")) {
			request.setAttribute("category", "의류/하네스");
		} else if(category.equals("cat")) {
			request.setAttribute("category", "고양이");
		} else if(category.equals("walk")) {
			request.setAttribute("category", "이동/산책");
		} else if(category.equals("food")) {
			request.setAttribute("category", "사료/간식");
		} else if(category.equals("dog")) {
			request.setAttribute("category", "강아지");
		}
		
		request.setAttribute("sort", sort);
		
		Criteria cri = new Criteria(1, 16);
		int count = mdao.itemCount(category);
		
		ArrayList<ProductDTO> dtos = null;
		if(sort.equals("P_A_PRICE_ASC")) {
			ProductlistDTO listdto = new ProductlistDTO(null, category, "P_A_PRICE", null, cri);
			dtos = mdao.itemsortASC(listdto);
		} else {
			ProductlistDTO listdto = new ProductlistDTO(null, category, sort, null, cri);
			dtos = mdao.itemsortDESC(listdto);
		}
		
		request.setAttribute("itemCount", count);
		request.setAttribute("result", dtos);
		return "item";
		
	}
	
	@RequestMapping("/item_search")
	public String item_search(@RequestParam(value = "value") String value, HttpServletRequest request) {
		ArrayList<ProductDTO> dtos = null;
		String search = "%" + value + "%";
		
		dtos = mdao.itemsearch(search);
		int count = mdao.itemsearchCount(search);
		
		request.setAttribute("value", value);
		request.setAttribute("itemCount", count);
		request.setAttribute("result", dtos);
		return "item_search";
	}
	
}
