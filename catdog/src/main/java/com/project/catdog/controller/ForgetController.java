package com.project.catdog.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.catdog.Command.ForgetEmailCommand;
import com.project.catdog.Command.ForgetUserCommand;
import com.project.catdog.Command.MainCommand;
import com.project.catdog.Command.PwChgCommand;
import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

@Controller
@RequestMapping("/forget")
public class ForgetController {
	
	private MainCommand mcom;
	
	private MemberDAO mdao;
	@Autowired
	public void setMdao(MemberDAO mdao) {
		this.mdao = mdao;
		Constant.mdao = mdao;
	}
	
	@RequestMapping("/user")
	public String forget_user() {
		System.out.println("forget_user()");
		
		return "forget/forget_user";
	}
	@RequestMapping("/email")
	public String forget_email() {
		System.out.println("forget_email()");
		
		return "forget/forget_email";
	}
	@RequestMapping(value="/user/submit", produces="application/text;charset=UTF-8")
	public String forget_user_submit(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("유저정보 아이디 조회 실행");
		mcom = new ForgetUserCommand();
		mcom.execute(model, request);
		
		ArrayList<UserDTO> dtos = (ArrayList)request.getAttribute("result");
		System.out.println("검색결과");
		System.out.println(dtos.toString());
		
		if(dtos.isEmpty()) {
			return "forget/forget_NOresult";
		} else {
			return "forget/forget_result";
		}
	}
	@RequestMapping(value="/email/submit", produces="application/text;charset=UTF-8")
	public String forget_email_submit(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("유저정보 이메일 조회 실행");
		mcom = new ForgetEmailCommand();
		mcom.execute(model, request);
		
		ArrayList<UserDTO> dtos = (ArrayList)request.getAttribute("result");
		System.out.println("검색결과");
		System.out.println(dtos.toString());
		
		if(dtos.isEmpty()) {
			return "forget/forget_NOresult";
		} else {
			return "forget/forget_result";
		}
	}
	@RequestMapping("/pw")
	public String forget_pw() {
		System.out.println("forget_pw()");
		
		return "forget/forget_pw";
	}
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		String user_email = request.getParameter("user_email");
		UserDTO dto = new UserDTO(user_id, null, user_email, null, null, null, null);
		return mdao.email_idCheck(dto);
	}
	@RequestMapping("/pw2")
	public String forget_pw2(HttpServletRequest request) {
		System.out.println("forget_pw2()");
		String user_id = request.getParameter("user_id");
		request.setAttribute("user_id", user_id);
		return "forget/forget_pw2";
	}
	//pw 변경
	@RequestMapping("/pwchg")
	@ResponseBody
	public String pw_chg_submit(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("비밀번호 변경 실행");
		String user_id = request.getParameter("user_id");
		request.setAttribute("user_id", user_id);
		
		mcom = new PwChgCommand();
		mcom.execute(model, request);
		
		String result = (String)request.getAttribute("data");
		System.out.println("컨트롤러 값 : " + result);
		return result;
	}
}
