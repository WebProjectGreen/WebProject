package com.project.catdog.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.catdog.Command.MainCommand;
import com.project.catdog.Command.OrderSearchCommand;
import com.project.catdog.Command.ProductSubmitCommand;
import com.project.catdog.Command.ProductUpdateCommand;
import com.project.catdog.Command.ProductlistCommand;
import com.project.catdog.Command.ProductlistpageCommand;
import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.OrderDTO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.util.Constant;

@Controller
@RequestMapping("/adminpage")
public class AdminpageController {
	
	//�̹��� ���� ��� ����
	String path1 = "C:/Users/FLnguish/git/WebProject/catdog/src/main/webapp/resources/images/product/";
	String path2 = "C:/apache-tomcat-9.0.53/wtpwebapps/catdog/resources/images/product/";
	String path3 = "C:/Users/FLnguish/git/WebProject/catdog/src/main/webapp/resources/images/product/sub/";
	String path4 = "C:/apache-tomcat-9.0.53/wtpwebapps/catdog/resources/images/product/sub/";

	/*
	 * path1 : ��ũ�����̽� ���/resources/images/product/
	 * path2 : ������ġ ���/resources/images/product/
	 * path3 : ��ũ�����̽� ���/resources/images/product/sub/
	 * path4 : ������ġ ���/resources/images/product/sub/
	 * 3,4�� �ڿ� /sub/ ���°� Ȯ���ϼ���.
	 */
	
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
	
	//��ǰ���
	@RequestMapping("/prp")
	public String prp() {
		System.out.println("prp()");
		return "adminpage/prp";
	}
	@RequestMapping("/prp/submit")
	public String prp_submit(MultipartHttpServletRequest mtfRequest, Model model) {
		System.out.println("��ǰ��� ����");
		
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		try {
			//���� ����Ͻú��ʷ� ��ǰ�ڵ� �ۼ�
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			java.util.Date time = new java.util.Date();
			String p_code = dateFormat.format(time);
			
			String p_category = mtfRequest.getParameter("p_category");
			String p_name = mtfRequest.getParameter("p_name");
			int p_o_price = Integer.parseInt(mtfRequest.getParameter("p_price"));
			int p_delivery = Integer.parseInt(mtfRequest.getParameter("p_delivery"));
			int p_sale = Integer.parseInt(mtfRequest.getParameter("p_sale"));
			int p_a_price = (int)(p_o_price * (1 - p_sale * 0.01));
			int p_stock = Integer.parseInt(mtfRequest.getParameter("p_stock"));
			String p_content = mtfRequest.getParameter("p_content");
			
			//�̹��� ���� ���ε�
			MultipartFile mainimg = mtfRequest.getFile("p_mainimg");
			MultipartFile subimg = mtfRequest.getFile("p_subimg");
			
			if(mainimg.getOriginalFilename().equals("") || subimg.getOriginalFilename().equals("")) {
				throw new Exception("�̹��� ������ ����ֽ��ϴ�.");
			}
			
			//�����̹���
			String filename = mainimg.getOriginalFilename(); //���� �̸�
			String ext = filename.substring(filename.lastIndexOf(".") + 1); //Ȯ���� ���ϱ�
			String workspaceMain = path1 + p_code + "." + ext;
			String serverMain = path2 + p_code + "." + ext;
			String p_mainimg = p_code + "." + ext;
			
			//�����̹���

			filename = subimg.getOriginalFilename(); //���� �̸�
			ext = filename.substring(filename.lastIndexOf(".") + 1); //Ȯ���� ���ϱ�
			String workspaceSub = path3 + p_code + "." + ext;
			String serverSub = path4 + p_code + "." + ext;
			String p_subimg = p_code + "." + ext;
			
			//DTO ����
			ProductDTO dto = new ProductDTO(p_code, p_category, p_name, p_o_price, p_delivery, p_sale, p_a_price, p_stock, 0, p_content, p_mainimg, p_subimg, null);
			mtfRequest.setAttribute("dto", dto);
			
			mcom = new ProductSubmitCommand();
			mcom.execute(model, mtfRequest);
			
			Map<String, Object> map = model.asMap();
			String res = (String)map.get("result");
			
			if(res.equals("success")) {
				try {
					FileCopyUtils.copy(mainimg.getInputStream(), new FileOutputStream(workspaceMain));
					FileCopyUtils.copy(mainimg.getInputStream(), new FileOutputStream(serverMain));
					FileCopyUtils.copy(subimg.getInputStream(), new FileOutputStream(workspaceSub));
					FileCopyUtils.copy(subimg.getInputStream(), new FileOutputStream(serverSub));
				} catch(Exception e) {
					System.out.println(e.getMessage());
					transactionManager.rollback(status);
					
					//���ε� �̹��� �ѹ�
					File delectFile1 = new File(workspaceMain);
					File delectFile2 = new File(serverMain);
					File delectFile3 = new File(workspaceSub);
					File delectFile4 = new File(serverSub);
					
					if(delectFile1.exists()) {
						System.out.println("��ũ�����̽� �����̹��� �ѹ�");
						delectFile1.delete();
					}
					if(delectFile2.exists()) {
						System.out.println("��Ĺ �����̹��� �ѹ�");
						delectFile2.delete();
					}
					if(delectFile3.exists()) {
						System.out.println("��ũ�����̽� �����̹��� �ѹ�");
						delectFile3.delete();
					}
					if(delectFile4.exists()) {
						System.out.println("��Ĺ �����̹��� �ѹ�");
						delectFile4.delete();
					}
					
					String error = e.getMessage();
					model.addAttribute("error", error);
					return "adminpage/error";
				}
				
				System.out.println("���Ͼ��ε� �Ϸ�");
				
			} else {
				throw new Exception("DB��� ����");
			}
			
			System.out.println("Ŀ�� �Ϸ�");
			transactionManager.commit(status);
			
		} catch(Exception e) {
			e.printStackTrace();
			String error = e.getMessage();
			model.addAttribute("error", error);
			return "adminpage/error";
		}
		
		return "redirect:../pm";
	}
	
	//��ǰ����
	@RequestMapping("/pm")
	public String pm() {
		return "adminpage/pm";
	}
	@RequestMapping("/defaultlist")
	public String defaultlist(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("�ʱ� ����Ʈ �˻� Ȱ��ȭ");
		
		model.addAttribute("category", "all");
		model.addAttribute("sort1", "P_CODE");
		model.addAttribute("sort2", "DESC");
		
		mcom = new ProductlistCommand();
		mcom.execute(model, request);
		
		return "adminpage/list";
	}
	@RequestMapping("/pm/list")
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("����Ʈ �˻� Ȱ��ȭ");
		
		mcom = new ProductlistCommand();
		mcom.execute(model, request);
		
		return "adminpage/list";
	}
	@RequestMapping("/pm/list_page")
	public String list_page(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("������ �̵�");
		
		mcom = new ProductlistpageCommand();
		mcom.execute(model, request);
		
		return "adminpage/list";
	}
	
	//��ǰ����
	@RequestMapping("/p_update")
	public String p_update() {
		System.out.println("��ǰ���� �˾�â ����");
		
		return "adminpage/p_update";
	}
	
	@RequestMapping(value="/p_update_list", method=RequestMethod.GET)
	public String p_update_list(String p_code, HttpServletRequest request) {
		System.out.println("������ �� ��ǰ�ڵ� : " + p_code);
		
		ProductDTO dto = mdao.p_update_list(p_code);
		System.out.println("�˻���� ��ǰ�� : " + dto.getP_name());
		request.setAttribute("dto", dto);
		
		return "adminpage/p_update_list";
	}
	
	@RequestMapping("/p_update_submit")
	public String p_update_submit(MultipartHttpServletRequest mtfRequest, Model model) {
		System.out.println("��ǰ���� ���� ����");
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		String p_code = mtfRequest.getParameter("p_code");
		System.out.println("������ ��ǰ�� �ڵ� : " + p_code);
		
		ProductDTO dto = new ProductDTO();
		
		//�̹��� ���� ���ε�
		MultipartFile mainimg = mtfRequest.getFile("p_mainimg");
		MultipartFile subimg = mtfRequest.getFile("p_subimg");
		String mainfilename = mainimg.getOriginalFilename();
		String subfilename = subimg.getOriginalFilename();
		
		//���� �̹������� �ҷ�����
		File old_workspaceMain = new File(path1 + mtfRequest.getParameter("p_old_mainimg"));
		File old_serverMain = new File(path2 + mtfRequest.getParameter("p_old_mainimg"));
		File old_workspaceSub = new File(path3 + mtfRequest.getParameter("p_old_subimg"));
		File old_serverSub = new File(path4 + mtfRequest.getParameter("p_old_subimg"));
		
		String ext1 = mainfilename.substring(mainfilename.lastIndexOf(".") + 1); //Ȯ���� ���ϱ�
		String workspaceMain = path1 + p_code + "." + ext1;
		String serverMain = path2 + p_code + "." + ext1;
		String p_mainimg = p_code + "." + ext1;
		
		String ext2 = subfilename.substring(subfilename.lastIndexOf(".") + 1); //Ȯ���� ���ϱ�
		String workspaceSub = path3 + p_code + "." + ext2;
		String serverSub = path4 + p_code + "." + ext2;
		String p_subimg = p_code + "." + ext2;
		
		//�����̹���
		if(!(mainfilename.equals(""))) {
			dto.setP_mainimg(p_mainimg);
		}
		
		//�����̹���
		if(!(subfilename.equals(""))) {
			dto.setP_subimg(p_subimg);
		}
		
		System.out.println("����� �̹���");
		System.out.println("main : " + dto.getP_mainimg());
		System.out.println("sub : " + dto.getP_subimg());
		
		String p_category = mtfRequest.getParameter("p_category");
		String p_name = mtfRequest.getParameter("p_name");
		int p_o_price = Integer.parseInt(mtfRequest.getParameter("p_price"));
		int p_delivery = Integer.parseInt(mtfRequest.getParameter("p_delivery"));
		int p_sale = Integer.parseInt(mtfRequest.getParameter("p_sale"));
		int p_a_price = (int)(p_o_price * (1 - p_sale * 0.01));
		int p_stock = Integer.parseInt(mtfRequest.getParameter("p_stock"));
		String p_content = mtfRequest.getParameter("p_content");
		
		//DTO ����
		dto.setP_code(p_code);
		dto.setP_category(p_category);
		dto.setP_name(p_name);
		dto.setP_o_price(p_o_price);
		dto.setP_delivery(p_delivery);
		dto.setP_sale(p_sale);
		dto.setP_a_price(p_a_price);
		dto.setP_stock(p_stock);
		dto.setP_content(p_content);
		mtfRequest.setAttribute("dto", dto);
		
		mcom = new ProductUpdateCommand();
		mcom.execute(model, mtfRequest);
		
		String result = (String)mtfRequest.getAttribute("result");
		if(result.equals("success"))
			System.out.println("DB ������Ʈ �Ϸ�");
		else
			return "adminpage/error";
		
		File testfile1 = new File(path1 + "test.txt");
		File testfile2 = new File(path2 + "test.txt");
		File testfile3 = new File(path3 + "test.txt");
		File testfile4 = new File(path4 + "test.txt");
		
		//�̹��� ��� �׽�Ʈ
		System.out.println("���� ��� ��ȿ�� �˻����");
		if(!(mainfilename.equals(""))) {
			try {
				testfile1.createNewFile();
				testfile2.createNewFile();
				testfile1.delete();
				testfile2.delete();
			} catch(Exception e) {
				transactionManager.rollback(status);
				testfile1.delete();
				testfile2.delete();
				String error = e.getMessage();
				model.addAttribute("error", error);
				return "adminpage/error";
			}
		}
		
		if(!(subfilename.equals(""))) {
			try {
				testfile3.createNewFile();
				testfile4.createNewFile();
				testfile3.delete();
				testfile4.delete();
			} catch(Exception e) {
				transactionManager.rollback(status);
				testfile3.delete();
				testfile4.delete();
				String error = e.getMessage();
				model.addAttribute("error", error);
				return "adminpage/error";
			}
		}
		
		//�̹��� ���� ������Ʈ
		System.out.println("�̹��� ���� ������Ʈ ����");
		if(!(mainfilename.equals(""))) {
			try {
				old_workspaceMain.delete();
				old_serverMain.delete();
				FileCopyUtils.copy(mainimg.getInputStream(), new FileOutputStream(workspaceMain));
				FileCopyUtils.copy(mainimg.getInputStream(), new FileOutputStream(serverMain));
			} catch(Exception e) {
				transactionManager.rollback(status);
				String error = e.getMessage();
				model.addAttribute("error", error);
				return "adminpage/error";
			}
		}
		
		if(!(subfilename.equals(""))) {
			try {
				old_workspaceSub.delete();
				old_serverSub.delete();
				FileCopyUtils.copy(subimg.getInputStream(), new FileOutputStream(workspaceSub));
				FileCopyUtils.copy(subimg.getInputStream(), new FileOutputStream(serverSub));
			} catch(Exception e) {
				transactionManager.rollback(status);
				String error = e.getMessage();
				model.addAttribute("error", error);
				return "adminpage/error";
			}
		}
		
		System.out.println("Ŀ�� �Ϸ�");
		transactionManager.commit(status);
		
		return "adminpage/p_update_success";
	}
	
	@RequestMapping("/p_delete")
	@ResponseBody
	public String p_delete(@RequestParam(value = "code[]") List<String> p_code,
						   @RequestParam(value = "mainimg[]") List<String> p_mainimg,
						   @RequestParam(value = "subimg[]") List<String> p_subimg) {
		System.out.println("��ǰ���� ����");
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		for(int i = 0; i < p_code.size(); i++) {
			mdao.p_delete(p_code.get(i));
			
			//���� �̹������� �ҷ�����
			File workspaceMain = new File(path1 + p_mainimg.get(i));
			File serverMain = new File(path2 + p_mainimg.get(i));
			File workspaceSub = new File(path3 + p_subimg.get(i));
			File serverSub = new File(path4 + p_subimg.get(i));
			
			try {
				workspaceMain.delete();
				serverMain.delete();
				workspaceSub.delete();
				serverSub.delete();
			} catch(Exception e) {
				transactionManager.rollback(status);
				return "error";
			}
			
			System.out.println(p_code.get(i) + " �����Ϸ�");
		}
		
		System.out.println("Ŀ�� �Ϸ�");
		transactionManager.commit(status);
		
		return String.valueOf(p_code);
	}
	
	//�ֹ�����
	@RequestMapping("/order")
	public String order() {
		return "adminpage/order";
	}
	
	//�ֹ����� �˻�
	@RequestMapping("/order_search")
	public String order_search(HttpServletRequest request, Model model) {
		int count_all = mdao.order_count_admin("all");
		int count_1 = mdao.order_count_admin("�ֹ����");
		int count_2 = mdao.order_count_admin("�߼۴��");
		int count_3 = mdao.order_count_admin("�����");
		int count_4 = mdao.order_count_admin("��ۿϷ�");
		int count_5 = mdao.order_count_admin("����Ȯ��");
		
		mcom = new OrderSearchCommand();
		mcom.execute(model, request);
		
		request.setAttribute("count_all", count_all);
		request.setAttribute("count_1", count_1);
		request.setAttribute("count_2", count_2);
		request.setAttribute("count_3", count_3);
		request.setAttribute("count_4", count_4);
		request.setAttribute("count_5", count_5);
		
		return "adminpage/order_list";
	}
	
	//�ֹ� ��ۻ��� ����
	@RequestMapping("/state_update")
	@ResponseBody
	public String state_update(@RequestParam (value="order_num") String order_num,
							   @RequestParam (value="state") String state,
								HttpServletRequest request) {
		if(state.equals("1"))
			state = "�ֹ����";
		else if(state.equals("2"))
			state = "�߼۴��";
		else if(state.equals("3"))
			state = "�����";
		else if(state.equals("4"))
			state = "��ۿϷ�";
		OrderDTO dto = new OrderDTO(order_num, null, null, null, null, 0, 0, null, state, null);
		
		return mdao.order_state_update(dto);
	}
		
}
