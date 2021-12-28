package com.project.catdog.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.project.catdog.DAO.MemberDAO;
import com.project.catdog.DTO.UserDTO;
import com.project.catdog.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDAO mdao = Constant.mdao;
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		UserDTO dto = mdao.login(username);
		System.out.println("dto : " + dto);
		if(dto == null) {
			System.out.println("일치하는 ID 없음");
			throw new UsernameNotFoundException("No user found with username");
		}
		
		String id = dto.getUser_id();
		String pw = dto.getUser_pw();
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		//권한 부여	
		if(id.equals("admin")) {
			roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			String org_pw = pw;
			pw = passwordEncoder.encode(org_pw);
		}
		else {
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		}
		
		UserDetails user = new User(username, pw, roles);
		Constant.username = username;
		return user;
	}

}
