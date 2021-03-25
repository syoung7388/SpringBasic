package com.KI.example.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;
import com.KI.example.domain.User;
import java.util.List;

@Mapper
public interface UserMapper {
	
	public User readUser(String username);
	
	public void createUser(User user);
	
	public List<GrantedAuthority> readAuthorities(String username);
	
	public void createAuthority(User user);

}
