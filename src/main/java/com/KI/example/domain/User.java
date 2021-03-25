package com.KI.example.domain;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private String username;// set만
	private String password;//set만
	private String uName;
	private String uDateTime;
	
	
	private Collection<?extends GrantedAuthority> authorities;
	
	
	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private boolean isEnabled;
	
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuDateTime() {
		return uDateTime;
	}

	public void setuDateTime(String uDateTime) {
		this.uDateTime = uDateTime;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired= isAccountNonExpired;
	}
	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked= isAccountNonLocked;
	}
	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired= isCredentialsNonExpired;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled=isEnabled;
	}
	public void setAuthorities(Collection<?extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	@Override
	public Collection<? extends  GrantedAuthority> getAuthorities(){
		return authorities;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append(", uName=");
		builder.append(uName);
		builder.append(", uDateTime=");
		builder.append(uDateTime);
		builder.append(", authorities=");
		builder.append(authorities);
		builder.append(", isAccountNonExpired=");
		builder.append(isAccountNonExpired);
		builder.append(", isAccountNonLocked=");
		builder.append(isAccountNonLocked);
		builder.append(", isCredentialsNonExpired=");
		builder.append(isCredentialsNonExpired);
		builder.append(", isEnabled=");
		builder.append(isEnabled);
		builder.append("]");
		return builder.toString();
	}
	@Override
	public String getPassword() {
		return password;
	}
	
	@Override
	public String getUsername() {
		return username;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return isAccountNonExpired;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return isAccountNonLocked;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return isCredentialsNonExpired;
	}
	@Override
	public boolean isEnabled() {
		return isEnabled;
	}


}
