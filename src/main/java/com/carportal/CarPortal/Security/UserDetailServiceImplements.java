package com.carportal.CarPortal.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.carportal.CarPortal.Entity.CarEntity;
import com.carportal.CarPortal.Repository.CarRepo;

public class UserDetailServiceImplements implements UserDetailsService{

	@Autowired
	CarRepo carrepo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		CarEntity cars = carrepo.findByUsername(username);
		
		if(cars == null) {
			System.out.println("Cannot find user with this username");
			throw new UsernameNotFoundException("Cannot find user with this username");
		}
		
		CustumCarDetails custumUsername = new CustumCarDetails(cars);
		return custumUsername;
	}

}
