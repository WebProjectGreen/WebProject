package com.project.catdog.DAO;

import java.util.ArrayList;

import com.project.catdog.DTO.CartDTO;
import com.project.catdog.DTO.OrderDTO;
import com.project.catdog.DTO.OrderItemDTO;
import com.project.catdog.DTO.OrderlistDTO;
import com.project.catdog.DTO.AddressDTO;
import com.project.catdog.DTO.ProductCountDTO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.DTO.ProductlistDTO;
import com.project.catdog.DTO.UserDTO;

public interface MemberIDAO {
	public String idCheck(String user_id);
	public String mailverifyCheck(String user_email);
	public String signup(UserDTO dto);
	public ArrayList<UserDTO> forgetUser(UserDTO dto);
	public ArrayList<UserDTO> forgetEmail(UserDTO dto);
	public UserDTO login(String user_id);
	public String prp(ProductDTO dto);
	public ArrayList<ProductDTO> productlist(ProductlistDTO dto);
	public ProductCountDTO productCount();
	public ProductDTO p_update_list(String p_code);
	public String p_update(ProductDTO dto);
	public void p_delete(String p_code);
	public ArrayList<ProductDTO> item(String category);
	public int itemCount(String category);
	public ArrayList<ProductDTO> itemsortDESC(ProductlistDTO dto);
	public ArrayList<ProductDTO> itemsortASC(ProductlistDTO dto);
	public String remove2(String principal);
	public ArrayList<ProductDTO> itemsearch(String search);
	public int itemsearchCount(String search);
	public int productlistCount(ProductlistDTO dto);
	public ProductDTO itemviews(String p_code);
	public String addcart(CartDTO dto);
	public String pwcheck(String user_id);
	public UserDTO userSearch(String user_id);
	public AddressDTO addressSearch(String user_id);
	public String userBirth(String user_id);
	public String update_email(UserDTO dto);
	public int selectAddress(AddressDTO dto);
	public void saveAddress_update(AddressDTO dto);
	public void saveAddress_insert(AddressDTO dto);
	public ArrayList<UserDTO> mypageUser(UserDTO dto);
	public String pwChgUp(UserDTO dto);
	public String userUpdate(UserDTO dto);
	public String verifycart(CartDTO dto);
	public void set_order_item(OrderItemDTO dto);
	public void set_order(OrderDTO dto);
	public ArrayList<OrderDTO> order_select(OrderlistDTO dto);
	public ArrayList<String> order_p_code(String order_num);
	public String order_p_name(String p_code);
	public String order_p_img(String p_code);
	public ArrayList<Integer> order_p_stock(String order_num);
	public OrderDTO order_info(String order_num);
	public ArrayList<OrderItemDTO> order_info_item(String order_num);
	public String order_info_img(String p_code);
	public String order_info_name(String p_code);
	public int order_count_user(OrderlistDTO dto);
	public ArrayList<OrderDTO> order_search(OrderlistDTO dto);
	public String order_state_update(OrderDTO dto);
	public void order_complete(String order_num);
	public int order_count_admin(String state);
	public String email_idCheck(UserDTO dto);
	public ArrayList<CartDTO> cartlist(String user_id);
	public void deletecart(CartDTO dto);
	public CartDTO paycart(CartDTO dto);
	public void addbuy(OrderItemDTO dto);
	public void addstock(OrderItemDTO dto);
}