package com.carportal.CarPortal.Security;


import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.carportal.CarPortal.Entity.CarEntity;


@SuppressWarnings("serial")
@Component
public class CustumCarDetails implements UserDetails {

	
	CarEntity cars;
	
	public CustumCarDetails() {
		super();
	}
	
	public CustumCarDetails(CarEntity cars) {
		super();
		this.cars = cars;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return Collections.singletonList(new SimpleGrantedAuthority(cars.getRole()));
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return cars.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return cars.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
