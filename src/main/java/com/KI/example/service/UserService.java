package com.KI.example.service;
import org.springframework.security.core.userdetails.UserDetailsService;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import com.KI.example.domain.User;



public interface UserService extends UserDetailsService {
	
	public User readUser(String username);
	
	public void createUser(User user);
	
	public void createAuthorities(User user);
	
	Collection<GrantedAuthority> getAuthorities(String username);

	

	

}
