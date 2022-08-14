package com.carportal.CarPortal.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;




@Configuration
@EnableWebSecurity
public class CarConfigurations extends WebSecurityConfigurerAdapter {
	
	@Autowired
	LoginSuccessHandler roles;


	@Bean
	public UserDetailsService getUserDetailService() {
		return (UserDetailsService) new UserDetailServiceImplements();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();		
	}
	
	@Bean
	public DaoAuthenticationProvider daoAuthProvider() {
		
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
	
		authProvider.setUserDetailsService(this.getUserDetailService());
		authProvider.setPasswordEncoder(passwordEncoder());	
		
		return authProvider;		
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(daoAuthProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
		.antMatchers("/admin/**","/update/**","/search").hasAnyAuthority("ADMIN")
		
		.antMatchers("/user/**","/search","/update/**").hasAnyAuthority("USER")
		.antMatchers("/registration","/register","/login","/**","/resources/**","/CSS/**","/Images/**","/search").permitAll()
		.anyRequest()
		.authenticated() 
		.and()
		.formLogin()
		.loginPage("/login").permitAll()
		.loginProcessingUrl("/login")
		.failureUrl("/loginfailed")
		.successHandler(roles)
		.and()
		.logout()
		.logoutUrl("/logout")
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.clearAuthentication(true)
		.invalidateHttpSession(true);
	}	
}
