package com.project.catdog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.stream.Stream;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.project.catdog.DTO.CartDTO;
import com.project.catdog.DTO.OrderDTO;
import com.project.catdog.DTO.OrderItemDTO;
import com.project.catdog.DTO.OrderlistDTO;
import com.project.catdog.DTO.AddressDTO;
import com.project.catdog.DTO.ProductCountDTO;
import com.project.catdog.DTO.ProductDTO;
import com.project.catdog.DTO.ProductlistDTO;
import com.project.catdog.DTO.UserDTO;

public class MemberDAO implements MemberIDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//ȸ������
	@Override
	public String idCheck(String user_id) {
		int result = sqlSession.selectOne("idCheck", user_id);
		if(result > 0) {
			return "1"; //���̵� �ߺ�
		} else {
			return "0"; //�ߺ� ����
		}
	}

	@Override
	public String mailverifyCheck(String user_email) {
		int result = sqlSession.selectOne("mailverifyCheck", user_email);
		System.out.println(result);
		if(result > 0) {
			return "1"; //���� �ߺ�
		} else {
			return "0"; //�ߺ� ����
		}
	}

	@Override
	public String signup(UserDTO dto) {
		int res = sqlSession.insert("signup", dto);
		System.out.println("���࿩�� : " + res);
		
		String result = null;
		if(res > 0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}
	
	//ID,PW ã��
	@Override
	public ArrayList<UserDTO> forgetUser(UserDTO dto) {
		ArrayList<UserDTO> result = (ArrayList)sqlSession.selectList("forgetUser", dto);
		return result;
	}
	@Override
	public ArrayList<UserDTO> forgetEmail(UserDTO dto) {
		ArrayList<UserDTO> result = (ArrayList)sqlSession.selectList("forgetEmail", dto);
		return result;
	}
	
	//�α���
	@Override
	public UserDTO login(String user_id) {
		System.out.println("�޾ƿ� user_id : " + user_id);
		UserDTO result = sqlSession.selectOne("login", user_id);
		return result;
	}
		
	//��ǰ���
	@Override
	public String prp(ProductDTO dto) {
		String res;
		int result = sqlSession.insert("prp", dto);
		if(result == 1) {
			res = "success";
		} else {
			res = "error";
		}
		return res;

	}
	
	//��ǰ����Ʈ
	@Override
	public ArrayList<ProductDTO> productlist(ProductlistDTO dto) {
		
		ArrayList<ProductDTO> dtos = null;
		
		if(dto.getsName().equals("")) {
			if(dto.getCategory().equals("all")) {
				if(dto.getSort2().equals("ASC")) {
					dtos = (ArrayList)sqlSession.selectList("productlistAll_ASC", dto);
				} else if(dto.getSort2().equals("DESC")) {
					dtos = (ArrayList)sqlSession.selectList("productlistAll_DESC", dto);
				}
			} else {
				if(dto.getSort2().equals("ASC")) {
				dtos = (ArrayList)sqlSession.selectList("productlist_ASC", dto);
				} else if(dto.getSort2().equals("DESC")) {
					dtos = (ArrayList)sqlSession.selectList("productlist_DESC", dto);
				}
			}
		} else {
			if(dto.getCategory().equals("all")) {
				if(dto.getSort2().equals("ASC")) {
					dtos = (ArrayList)sqlSession.selectList("productlistAll_ASC_LIKE", dto);
				} else if(dto.getSort2().equals("DESC")) {
					dtos = (ArrayList)sqlSession.selectList("productlistAll_DESC_LIKE", dto);
				}
			} else {
				if(dto.getSort2().equals("ASC")) {
				dtos = (ArrayList)sqlSession.selectList("productlist_ASC_LIKE", dto);
				} else if(dto.getSort2().equals("DESC")) {
					dtos = (ArrayList)sqlSession.selectList("productlist_DESC_LIKE", dto);
				}
			}
		}
		
		return dtos;
	}
	
	//��ǰ ���� üũ
	@Override
	public ProductCountDTO productCount() {
		int total = sqlSession.selectOne("ProductCount_total");
		int fashion = sqlSession.selectOne("ProductCount_fashion");
		int walk = sqlSession.selectOne("ProductCount_walk");
		int food = sqlSession.selectOne("ProductCount_food");
		int cat = sqlSession.selectOne("ProductCount_cat");
		int dog = sqlSession.selectOne("ProductCount_dog");
		
		ProductCountDTO dtoc = new ProductCountDTO(total, fashion, walk, food, cat, dog);
		return dtoc;
	}
	
	//��ǰ �˻� ���� üũ
	@Override
	public int productlistCount(ProductlistDTO dto) {
		int result;
		if(dto.getCategory().equals("all")) {
			result = sqlSession.selectOne("productlistCount_All", dto);
		} else {
			result = sqlSession.selectOne("productlistCount", dto);
		}
		return result;
	}

	//��ǰ���� ��� ǥ��
	@Override
	public ProductDTO p_update_list(String p_code) {
		ProductDTO dto = sqlSession.selectOne("p_update_list", p_code);
		return dto;
	}

	@Override
	public String p_update(ProductDTO dto) {
		int res;
		String result;
		String p_mainimg = dto.getP_mainimg();
		String p_subimg = dto.getP_subimg();
		
		if(p_mainimg == null && p_subimg == null)
			res = sqlSession.update("p_update_1", dto);
		else if(p_mainimg != null && p_subimg == null)
			res = sqlSession.update("p_update_2", dto);
		else if(p_mainimg == null && p_subimg != null)
			res = sqlSession.update("p_update_3", dto);
		else
			res = sqlSession.update("p_update_4", dto);
		
		if(res > 0)
			result = "success";
		else
			result = "error";
		
		return result;
	}
	
	//��ǰ����
	@Override
	public void p_delete(String p_code) {
		sqlSession.delete("p_delete", p_code);
	}
	
	//������ ī��Ʈ
	@Override
	public int itemCount(String category) {
		int result = sqlSession.selectOne("itemCount", category);
		return result;
	}

	//������ ��� ����
	@Override
	public ArrayList<ProductDTO> item(String category) {
		ArrayList<ProductDTO> result = (ArrayList)sqlSession.selectList("item", category);
		return result;
	}
	
	//������ ����
	@Override
	public ArrayList<ProductDTO> itemsortDESC(ProductlistDTO dto) {
		ArrayList<ProductDTO> result = (ArrayList)sqlSession.selectList("itemsort_DESC", dto);
		return result;
	}
	@Override
	public ArrayList<ProductDTO> itemsortASC(ProductlistDTO dto) {
		ArrayList<ProductDTO> result = (ArrayList)sqlSession.selectList("itemsort_ASC", dto);
		return result;
	}

	// ȸ��Ż��
	@Override
	public String remove2(String user_id) {
		String res;
		System.out.println("DAO����");
		System.out.println("�޾ƿ� user_id: " + user_id);
		
		sqlSession.delete("delete_address", user_id);
		sqlSession.delete("delete_cart", user_id);
		int result = sqlSession.delete("delete_user", user_id);
		System.out.println("result : " + result);
		
		if(result > 0) {
			res = "success";
		} else {
			res = "error";
		}
		
		return res;
	}
	
	//������ �˻�
	@Override
	public ArrayList<ProductDTO> itemsearch(String search) {
		ArrayList<ProductDTO> result = (ArrayList)sqlSession.selectList("itemsearch", search);
		return result;
	}
	//������ �˻� ī��Ʈ 
	@Override
	public int itemsearchCount(String search) {
		int result = sqlSession.selectOne("itemsearchCount", search);
		return result;
	}
	
	//pwȮ��
	@Override
	public String pwcheck(String user_id) {
		String result = sqlSession.selectOne("pwcheck", user_id);
		return result;
	}
	
	//����Ȯ��
	@Override
	public UserDTO userSearch(String user_id) {
		UserDTO userdto = sqlSession.selectOne("userSearch", user_id);
		return userdto;
	}
	//���������Ȯ��
	@Override
	public AddressDTO addressSearch(String user_id) {
		AddressDTO addressdto = sqlSession.selectOne("addressSearch", user_id);
		return addressdto;
	}
	
	//��������
	@Override
	public String userBirth(String user_id) {
		String result = sqlSession.selectOne("userBirth", user_id);
		return result;
	}
	
	//�̸��� ����
	@Override
	public String update_email(UserDTO dto) {
		String res;
		int result = sqlSession.update("update_email", dto);
		if(result > 0) {
			res = "success";
		} else {
			res = "error";
		}
		return res;
	}
	
	//�ߺ��ּ� Ȯ��
	@Override
	public int selectAddress(AddressDTO dto) {
		int result = sqlSession.selectOne("selectAddress", dto);
		return result;
	}
	//�ּ��ۼ�(update)
	@Override
	public void saveAddress_update(AddressDTO dto) {
		sqlSession.update("saveAddress_update", dto);
	}
	//�ּ��ۼ�(insert)
	@Override
	public void saveAddress_insert(AddressDTO dto) {
		sqlSession.insert("saveAddress_insert", dto);
	}

	public ProductDTO itemviews(String p_code) {
		ProductDTO dto = sqlSession.selectOne("itemviews", p_code);		
		return dto;
	}
	
	//��ٱ��� ���
	@Override
	public String addcart(CartDTO p_code) {
		String res;
		int result = sqlSession.insert("addcart", p_code);
		if(result > 0)
			res = "success";
		else
			res = "error";
		return res;
	}
	
	//��ٱ��� �ߺ��˻�
	@Override
	public String verifycart(CartDTO dto) {
		String res;
		int result = sqlSession.selectOne("verifycart", dto);
		if(result == 0) {
			res = "success";
		} else {
			res = "error";
		}
		return res;
	}
	
	//��ٱ��� ����
	@Override
	public void deletecart(CartDTO dto) {
		sqlSession.delete("deletecart", dto);
	}

	//ȸ������
	@Override
	public ArrayList<UserDTO> mypageUser(UserDTO dto) {
		ArrayList<UserDTO> result = (ArrayList)sqlSession.selectList("mypageUser", dto);
		return result;
	}
	
	// pw ����
	@Override
	public String pwChgUp(UserDTO dto) {
		int res = sqlSession.update("pwChgUp", dto);
		System.out.println("���࿩�� : " + res);
		
		String result = null;
		if(res > 0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}
	
	//ȸ����������
	@Override
	public String userUpdate(UserDTO dto) {
		int res = sqlSession.update("userUpdate", dto);
		System.out.println("���࿩�� : " + res);
		
		String result = null;
		if(res > 0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}
	
	//�ֹ� ��ǰ���� ���
	@Override
	public void set_order_item(OrderItemDTO dto) {
		sqlSession.insert("set_order_item", dto);
	}
	
	//�ֹ� ���
	@Override
	public void set_order(OrderDTO dto) {
		sqlSession.insert("set_order", dto);
	}
	
	//�ش� �������̵� �ֹ� �˻�
	@Override
	public ArrayList<OrderDTO> order_select(OrderlistDTO dto) {
		ArrayList<OrderDTO> dtos = null;
		if(dto.getState().equals("all")) {
			dtos = (ArrayList)sqlSession.selectList("order_select_all", dto);
		} else {
			dtos = (ArrayList)sqlSession.selectList("order_select", dto);
		}
		return dtos;
	}
	//�ֹ� p_code ��������
	@Override
	public ArrayList<String> order_p_code(String order_num) {
		ArrayList<String> result = (ArrayList)sqlSession.selectList("order_p_code", order_num);
		return result;
	}
	//�ֹ� p_name ��������
	@Override
	public String order_p_name(String p_code) {
		String result = sqlSession.selectOne("order_p_name", p_code);
		return result;
	}
	//�ֹ� p_img ��������
	@Override
	public String order_p_img(String p_code) {
		String result = sqlSession.selectOne("order_p_img", p_code);
		return result;
	}
	//�ֹ� p_stock ��������
	@Override
	public ArrayList<Integer> order_p_stock(String order_num) {
		ArrayList<Integer> result = (ArrayList)sqlSession.selectList("order_p_stock", order_num);
		return result;
	}
	//�ֹ����� ��������
	@Override
	public OrderDTO order_info(String order_num) {
		OrderDTO result = sqlSession.selectOne("order_info", order_num);
		return result;
	}
	//�ֹ� �ش� ���������� ��������
	@Override
	public ArrayList<OrderItemDTO> order_info_item(String order_num) {
		ArrayList<OrderItemDTO> result = (ArrayList)sqlSession.selectList("order_info_item", order_num);
		return result;
	}
	//�ֹ� ������ �̹��� ��������
	@Override
	public String order_info_img(String p_code) {
		String result = sqlSession.selectOne("order_info_img", p_code);
		return result;
	}
	//�ֹ� ������ �̸� ��������
	@Override
	public String order_info_name(String p_code) {
		String result = sqlSession.selectOne("order_info_name", p_code);
		return result;
	}
	//�ֹ� ī��Ʈ
	@Override
	public int order_count_user(OrderlistDTO dto) {
		int result = 0;
		if(dto.getState().equals("all")) {
			result = sqlSession.selectOne("order_count_user_all", dto);
		} else {
			result = sqlSession.selectOne("order_count_user", dto);
		}
		return result;
	}
	
	//���� �ֹ����� �˻�
	@Override
	public ArrayList<OrderDTO> order_search(OrderlistDTO dto) {
		ArrayList<OrderDTO> dtos = null;
		if(dto.getState().equals("all")) {
			if(dto.getOrderby().equals("DESC")) {
				dtos = (ArrayList)sqlSession.selectList("order_search_all_DESC", dto);
			} else {
				dtos = (ArrayList)sqlSession.selectList("order_search_all_ASC", dto);
			}
		} else {
			if(dto.getOrderby().equals("DESC")) {
				dtos = (ArrayList)sqlSession.selectList("order_search_DESC", dto);
			} else {
				dtos = (ArrayList)sqlSession.selectList("order_search_ASC", dto);
			}
		}
		return dtos;
	}
	
	//���� ��ۻ��� ����
	@Override
	public String order_state_update(OrderDTO dto) {
		String res;
		int result = sqlSession.update("order_state_update", dto);
		if(result > 0)
			res = "success";
		else
			res = "error";
		return res;
	}
	
	//���� ��ۻ��� ī��Ʈ
	@Override
	public int order_count_admin(String state) {
		int result = 0;
		if(state.equals("all")) {
			result = sqlSession.selectOne("order_count_admin_all", state);
		} else {
			result = sqlSession.selectOne("order_count_admin", state);
		}
		return result;
	}

	//����Ȯ��
	@Override
	public void order_complete(String order_num) {
		sqlSession.update("order_complete", order_num);
	}
	
	//��й�ȣ ���� ���̵� �̸��� ��ġ����
	@Override
	public String email_idCheck(UserDTO dto) {
		String res;
		int result = sqlSession.selectOne("email_idCheck", dto);
		if(result > 0) {
			res = "success";
		} else {
			res = "error";
		}
		return res;
	}

	@Override
	public ArrayList<CartDTO> cartlist(String user_id) {
		ArrayList<CartDTO> dtos = (ArrayList)sqlSession.selectList("cartlist", user_id);
		return dtos;
	}
	
	//��ٱ��� > �ֹ�����
	@Override
	public CartDTO paycart(CartDTO dto) {
		CartDTO result = sqlSession.selectOne("paycart", dto);
		return result;
	}
	
	//��ǰ �Ǹŷ� ����
	@Override
	public void addbuy(OrderItemDTO dto) {
		sqlSession.update("addbuy", dto);
	}
	//���Խ� ��ǰ ��� ����
	@Override
	public void addstock(OrderItemDTO dto) {
		sqlSession.update("addstock", dto);
	}
	
	
}
	
	
	


	

