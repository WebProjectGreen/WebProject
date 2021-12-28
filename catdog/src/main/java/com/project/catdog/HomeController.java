package com.project.catdog;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.catdog.Command.MainCommand;
import com.project.catdog.Command.MyfageUserCommand;
import com.project.catdog.Command.PwChgCommand;
import com.project.catdog.Command.SaveAddressCommand;
import com.project.catdog.Command.SignupCommand;
import com.project.catdog.Command.UserUpdateCommand;
import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.CartDTO;
import com.project.catdog.DTO.OrderDTO;
import com.project.catdog.DTO.OrderItemDTO;
import com.project.catdog.DTO.OrderlistDTO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.DTO.AddressDTO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	
	private MainCommand mcom;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "redirect:home";
	}
	
	//����ȭ��
	@RequestMapping("/home")
	public String home_user() {
		System.out.println("home()");

		return "home";
	}
	
	//������ ������
	@RequestMapping("/adminpage")
	public String adminpage() {
		System.out.println("������ ������ �̵�");
		
		return "adminpage/adminpage";
	}
	
	//�α���
	@RequestMapping("/login_view")
	public String login_view() {
		System.out.println("login_view()");
		return "login_view";
	}
	@RequestMapping("/login")
	public String login() {
		System.out.println("login()");
		return "login_view";
	}
	//login��û�� login form���� login�� ��ΰ� �ƴϰ� security-context.xml���� login��û�̳� <a href="login">
	//��û�� ó������ error�� �α��� ���н� ���� �Ķ�����̰� logout�Ķ���ʹ� logout������ ���� �Ķ������
	@RequestMapping(value = "/processLogin", method = RequestMethod.GET)
	public ModelAndView processLogin(
			@RequestParam(value = "log", required = false) String log,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout
			) {
		
		System.out.println("log");
		ModelAndView mav = new ModelAndView();
		if (log != null && log !="") {
			mav.addObject("log", "before login!");
		}
		if (error != null && error != "") {
			mav.addObject("error", "ȸ�� ������ ��ġ���� �ʽ��ϴ�.");
		} 
		if (logout != null && logout != "") {
			mav.addObject("logout", "You've been logged out successfully.");
		}	
		mav.setViewName("login_view");		
		return mav;		
	}
	
	//ID,PW ã��
	@RequestMapping("/forget")
	public String forget() {
		System.out.println("forget()");
		
		return "forget";
	}
	
	//ȸ������
	@RequestMapping("/signup")
	public String signup1() {
		System.out.println("signup()");
		return "signup1";
	}
	
	@RequestMapping("/signup2")
	public String signup2() {
		System.out.println("signup2()");
		return "signup2";
	}
	
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) throws Exception {
		System.out.println("���� �߼� ����");
		
		//�̸��� �Է� ������ Ȯ��
		logger.info("�̸��� ������ ���� Ȯ��");
		logger.info("���� : " + email);
		
		//������ȣ(����) ����
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("������ȣ : " + checkNum);
		
		//�̸��� ������
		String setFrom = "webprojectgreen@gmail.com";
		String toMail = email;
		String title = "cats&dogs ������ȣ ���� �Դϴ�.";
		String content =
				"cats&dogs Ȩ�������� �湮���ּż� �����մϴ�."
				+ "<br/><br/>"
				+ "���� ��ȣ��  " + checkNum + "  �Դϴ�."
				+ "<br/>"
				+ "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true�� ��Ƽ��Ʈ �޼����� ����ϰڴٴ� �ǹ�
            
            //�ܼ��� �ؽ�Ʈ �޼����� ���ÿ� �Ʒ��� �ڵ嵵 ��� ���� 
            //MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             
			mailHelper.setFrom(setFrom);
			
			mailHelper.setTo(toMail);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);
			//html�� ����ϰڴٴ� true
			
			mailSender.send(mail);
			System.out.println("���� �߼� �Ϸ�");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("���� �߼� ����");
		}
		
		String num = Integer.toString(checkNum);
		return num;
	}
	
	@RequestMapping(value="/mailverifyCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailverifyCheck(String email) throws Exception {
		System.out.println("���� �ߺ� �˻� ����");
		System.out.println("�޾ƿ� email : " + email);
		
		return mdao.mailverifyCheck(email);
	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(String user_id) throws Exception {
		System.out.println("idCheck() ����");
		System.out.println("�޾ƿ� user_id : " + user_id);
		
		return mdao.idCheck(user_id);
	}
	
	@RequestMapping("/signup_submit")
	@ResponseBody
	public String signup_submit(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("ȸ������ ����");

		mcom = new SignupCommand();
		mcom.execute(model, request);
		
		String result = (String)request.getAttribute("data");
		System.out.println("��Ʈ�ѷ� �� : " + result);
		return result;
	}
	
	//������
	@RequestMapping("/FAQ")
	public String FAQ() {
		System.out.println("FAQ()");
		return "FAQ";
	}
	
	//����������
	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("mypage()");
		return "mypage/mypage";
	}
	
	//��ٱ���
	@RequestMapping("/mypage_cart")
	public String mypage_cart() {
		return "mypage/cart";
	}
	//��ٱ��� ���
	@RequestMapping("/cart_list")
	public String cart_list(HttpServletRequest request, Principal principal) {
		String user_id = principal.getName();
		
		ArrayList<CartDTO> dtos = mdao.cartlist(user_id);
		request.setAttribute("result", dtos);
		
		return "mypage/cart_list";
	}
	@RequestMapping(value="/cartlist_img", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String cartlist_img(@RequestParam (value = "p_code") String p_code) {
		String p_img = mdao.order_p_img(p_code);
		return p_img;
	}
	//��ٱ��� ����
	@RequestMapping("/cart_delete")
	@ResponseBody
	public String cart_delete(@RequestParam (value = "code[]") List<String> p_code,
							  Principal principal) {
		String user_id = principal.getName();
		for(int i = 0; i < p_code.size(); i++) {
			CartDTO dto = new CartDTO(p_code.get(i), user_id, null, 0, 0, 0, 0);
			mdao.deletecart(dto);
		}
		
		return p_code.get(0);
	}
	
	//�ֹ�����
	@RequestMapping("/mypage_order")
	public String mypage_order(HttpServletRequest request, Principal principal) {
		String user_id = principal.getName();
		OrderlistDTO dto = new OrderlistDTO(user_id, null, null, null);
		dto.setState("all");
		int count_all = mdao.order_count_user(dto);
		dto.setState("�߼۴��");
		int count_1 = mdao.order_count_user(dto);
		dto.setState("�����");
		int count_2 = mdao.order_count_user(dto);
		dto.setState("��ۿϷ�");
		int count_3 = mdao.order_count_user(dto);
		dto.setState("����Ȯ��");
		int count_4 = mdao.order_count_user(dto);
		
		request.setAttribute("count_all", count_all);
		request.setAttribute("count_1", count_1);
		request.setAttribute("count_2", count_2);
		request.setAttribute("count_3", count_3);
		request.setAttribute("count_4", count_4);
		
		return "mypage/order";
	}
	@RequestMapping(value="/order_list", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	public String order_list(HttpServletRequest request, Principal principal,
							 @RequestParam (value = "state") String state) {
		String user_id = principal.getName();
		OrderlistDTO dto = new OrderlistDTO(user_id, null, state, null);
		ArrayList<OrderDTO> order = mdao.order_select(dto);
		request.setAttribute("result", order);
		return "mypage/order_list";
	}
	
	//�ֹ����
	@RequestMapping(value="/orderlist_name", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String orderlist_name(@RequestParam (value = "order_num") String order_num) {
		ArrayList<String> p_code = mdao.order_p_code(order_num);
		ArrayList<String> p_name = new ArrayList<String>();
		String name = "";
		for (int i = 0; i < p_code.size(); i++) {
			p_name.add(mdao.order_p_name(p_code.get(i)));
		}
		name = p_name.get(0);
		if(p_code.size() - 1 > 0)
			name += " �� " + (p_code.size() - 1) + "��";
		return name;
	}
	@RequestMapping(value="/orderlist_img", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String orderlist_img(@RequestParam (value = "order_num") String order_num) {
		ArrayList<String> p_code = mdao.order_p_code(order_num);
		String p_img = mdao.order_p_img(p_code.get(0));
		return p_img;
	}
	@RequestMapping(value="/orderlist_stock", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String orderlist_stock(@RequestParam (value = "order_num") String order_num) {
		ArrayList<Integer> p_stock = mdao.order_p_stock(order_num);
		int total = 0;
		for(int i = 0; i < p_stock.size(); i++) {
			total += p_stock.get(i);
		}
		String result = Integer.toString(total);
		return result;
	}
	
	//�ֹ�����
	@RequestMapping("/orderlist_info")
	public String orderlist_info(@RequestParam (value = "order_num") String order_num, HttpServletRequest request) {
		OrderDTO dto = mdao.order_info(order_num);
		ArrayList<OrderItemDTO> dtos = mdao.order_info_item(order_num);
		request.setAttribute("order", dto);
		request.setAttribute("result", dtos);
		return "mypage/order_info";
	}
	@RequestMapping(value="/order_info_img", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String order_info_img(@RequestParam (value = "p_code") String p_code) {
		String p_img = mdao.order_info_img(p_code);
		return p_img;
	}
	@RequestMapping(value="/order_info_name", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String order_info_name(@RequestParam (value = "p_code") String p_code) {
		String p_name = mdao.order_info_name(p_code);
		return p_name;
	}
	//����Ȯ��
	@RequestMapping("/order_complete")
	public String order_complete(@RequestParam (value = "order_num") String order_num, HttpServletRequest request) {
		mdao.order_complete(order_num);
		return "redirect:mypage_order";
	}
	
	//ȸ������
	@RequestMapping("/mypage_user")
	public String mypage_user() {
		return "mypage/user_update";
	}
	//pwȮ��
	@RequestMapping("/pwcheck")
	public String pwcheck(HttpServletRequest request, Principal principal) throws Exception {
		String user_id = principal.getName();
		String result = mdao.pwcheck(user_id);
		UserDTO userdto = mdao.userSearch(user_id);
		AddressDTO addressdto = mdao.addressSearch(user_id);
		String pw = request.getParameter("user_pw");
		if(passwordEncoder.matches(pw, result)) {
			System.out.println("��ġ");
		} else {
			throw new Exception();	
		}
		
		String year;
		String month;
		String day;
		
		//DATE -> String ��ȯ
		try {
			String user_birth = mdao.userBirth(user_id);
			year = user_birth.substring(0, 4);
			month = user_birth.substring(5, 7);
			day = user_birth.substring(8, 10);
		} catch(NullPointerException e) {
			year = "0000";
			month = "00";
			day = "00";
		}
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("addressinfo", addressdto);
		request.setAttribute("userinfo", userdto);
		return "mypage/user_update2";
	}
	//�̸��� ����
	@RequestMapping("/update_email")
	@ResponseBody
	public String update_email(@RequestParam (value = "email") String user_email,
							   HttpServletResponse response, Principal principal) throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		String user_id = principal.getName();
		UserDTO dto = new UserDTO(user_id, null, user_email, null, null, null, null);
		String result = mdao.update_email(dto);
		if(!(result.equals("success")))
			throw new Exception();
		return "mypage/user_update2";
	}
	
	
	@RequestMapping("/modify") 
	public String modify(HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("modify()");			
		mcom = new MyfageUserCommand();
		mcom.execute(model,request);
		
		return "modify";
	}
	//ȸ������ ����
	@RequestMapping("/user_update")
	@ResponseBody
	public String user_update(HttpServletRequest request, HttpServletResponse response, Model model, Principal principal) throws Exception {
		System.out.println("ȸ��������������");
		
		String user_id = principal.getName();
		request.setAttribute("user_id", user_id);
		mcom = new UserUpdateCommand();
		mcom.execute(model, request);
		
		String result = (String)request.getAttribute("data");
		System.out.println("��Ʈ�ѷ� �� : " + result);
		return result;
	}
	//pw ����
	@RequestMapping("/pw_chg_submit")
	@ResponseBody
	public String pw_chg_submit(HttpServletRequest request, HttpServletResponse response, Model model, Principal principal) throws Exception {
		System.out.println("��й�ȣ ���� ����");
		
		String user_id = principal.getName();
		request.setAttribute("user_id", user_id);
		mcom = new PwChgCommand();
		mcom.execute(model, request);
		
		String result = (String)request.getAttribute("data");
		System.out.println("��Ʈ�ѷ� �� : " + result);
		return result;
	}
	
	//����� ����
	@RequestMapping("/saveAddress")
	@ResponseBody
	public String saveAddress(HttpServletRequest request, Model model) {
		mcom = new SaveAddressCommand();
		mcom.execute(model, request);
		
		return "success";
	}
	
	//Ż��
	@RequestMapping("/remove")
	public String remove() {
		System.out.println("remove()");
		return "mypage/remove";
	}
	
	//���ô±�
	@RequestMapping("/roadmap")
	public String roadmap() {
		System.out.println("roadmap()");
		return "roadmap";
	}
	
	//����â
	@RequestMapping("/paymentpage")
	public String paymentpage() {
		System.out.println("paymentpage()");
		return "paymentpage";
	}
	//�ֹ�����
	@RequestMapping("/item_payment")
	public String item_payment() {
		System.out.println("item_payment()");
		return "item_payment";
	}
	
	//Ż��
	@RequestMapping("/remove2")
	@ResponseBody
	public String remove2(Principal principal) {
		System.out.println("ȸ��Ż�� ����");
		String user_id = principal.getName();
		System.out.println(user_id);
		
		return mdao.remove2(user_id);
	}
	
	//��ǰ��������
	@RequestMapping("/item_view")
	public String item_view(@RequestParam(value = "code") String p_code, HttpServletRequest request) { //code�� �Ķ���͸�
		System.out.println("item_view");
		System.out.println(p_code);
		
		ProductDTO dto = mdao.itemviews(p_code);
		request.setAttribute("result", dto);
		
		return "item_view"; 
	}
	
	//��ٱ��� ���
	@RequestMapping(value="/shopping_basket", method=RequestMethod.POST)
	@ResponseBody
	public String shopping_basket(HttpServletRequest request, Principal principal) throws Exception {
		String user_id = principal.getName();
	    String p_code = request.getParameter("p_code");
	    String cart_name = request.getParameter("cart_name");
	    int cart_price = Integer.parseInt(request.getParameter("cart_price"));
	    int cart_delivery = Integer.parseInt(request.getParameter("cart_delivery"));
	    int cart_sale = Integer.parseInt(request.getParameter("cart_sale"));
	    int cart_ea = Integer.parseInt(request.getParameter("cart_ea"));
	    
	    CartDTO dto = new CartDTO(p_code, user_id, cart_name, cart_price, cart_delivery, cart_sale, cart_ea);
		String result = mdao.verifycart(dto);
		if(!(result == "success"))
			throw new Exception("�̹� �߰��� ��ǰ");

		return mdao.addcart(dto);
	}
	
	//�ٷα���
	@RequestMapping("/directpay")
	public String directpay(HttpServletRequest request, Principal principal) {
		
		String p_code = request.getParameter("p_code");
		String user_id = principal.getName();
		String cart_name = request.getParameter("cart_name");
		int cart_price = Integer.parseInt(request.getParameter("cart_price"));
		int cart_delivery = Integer.parseInt(request.getParameter("cart_delivery"));
		int cart_sale = Integer.parseInt(request.getParameter("cart_sale"));
		int cart_ea = Integer.parseInt(request.getParameter("cart_ea"));	
		
		ProductDTO pdto = mdao.p_update_list(p_code);
		String IMGlink = pdto.getP_mainimg();
		AddressDTO addressdto = mdao.addressSearch(user_id);
		ArrayList<CartDTO> dtos = new ArrayList<CartDTO>();
		CartDTO dto = new CartDTO(p_code, user_id, cart_name, cart_price, cart_delivery, cart_sale, cart_ea);
		dtos.add(dto);
		
		request.setAttribute("IMGlink", IMGlink);
		request.setAttribute("addressinfo", addressdto);
		request.setAttribute("result", dtos);
		
		return "item_payment";
	}
	//��ٱ��� ����
	@RequestMapping("/cartpay")
	public String cartpay(@RequestParam (value = "code[]") List<String> code,
						  HttpServletRequest request, Principal principal) {
		String user_id = principal.getName();
		ArrayList<CartDTO> dtos = new ArrayList<CartDTO>();
		AddressDTO addressdto = mdao.addressSearch(user_id);
		request.setAttribute("addressinfo", addressdto);
		
		CartDTO cartdto = new CartDTO(null, user_id, null, 0, 0, 0 ,0);
		
		for(int i = 0; i < code.size(); i++) {
			cartdto.setP_code(code.get(i));
			CartDTO dto = mdao.paycart(cartdto);
			System.out.println(dto.getCart_name());
			dtos.add(dto);
		}
		
		request.setAttribute("result", dtos);
		
		return "mypage/item_payment";
	}
	
	//�����ϱ�
	@RequestMapping("/order_submit")
	@ResponseBody
	public String order_submit(HttpServletRequest request, Principal principal,
							  @RequestParam (value = "order_to") String order_to,
							  @RequestParam (value = "order_address") String order_address,
							  @RequestParam (value = "order_message") String order_message,
							  @RequestParam (value = "order_delivery") String order_delivery,
							  @RequestParam (value = "order_total") String order_total,
							  @RequestParam (value = "order_bankname") String order_bankname,
							  @RequestParam (value = "p_code[]") ArrayList<String> p_codes,
							  @RequestParam (value = "order_price[]") ArrayList<String> order_prices,
							  @RequestParam (value = "order_stock[]") ArrayList<String> order_stocks){
		
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		java.util.Date time = new java.util.Date();
		String order_num = dateFormat.format(time);
		int delivery = Integer.parseInt(order_delivery);
		int total = Integer.parseInt(order_total);
		String user_id = principal.getName();
		
		OrderDTO dto = new OrderDTO(order_num, user_id, order_to, order_address, order_message, delivery, total, order_bankname, "�ֹ����", null);
		mdao.set_order(dto);

		for(int i = 0; i < p_codes.size(); i++) {
            String p_code = p_codes.get(i);
            int order_price = Integer.parseInt(order_prices.get(i));
            int order_stock = Integer.parseInt(order_stocks.get(i));
            
            CartDTO cartdto = new CartDTO(p_code, user_id, null, 0, 0, 0, 0);
            OrderItemDTO dto2 = new OrderItemDTO(order_num, p_code, order_price, order_stock);
            try {
            	mdao.addstock(dto2);
            	mdao.addbuy(dto2);
            	mdao.deletecart(cartdto);
            	mdao.set_order_item(dto2);
            } catch(Exception e) {
    			transactionManager.rollback(status);
    			e.printStackTrace();
    		}
        }
		
		transactionManager.commit(status);
		System.out.println("Ŀ�� �Ϸ�");
		
		return String.valueOf(order_num);
	}
	
	//�ֹ� �Ϸ�
	@RequestMapping("/item_payment_complete")
	public String item_payment_complete() {
		return "item_payment_complete";
	}
	
	//ppt
	@RequestMapping("/folio")
	public String folio() {
		return "folio";
	}
}
