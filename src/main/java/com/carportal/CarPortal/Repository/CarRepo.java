package com.carportal.CarPortal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.carportal.CarPortal.Entity.CarEntity;

@Repository
public interface CarRepo extends JpaRepository<CarEntity , Integer>{

//	@Query("select u from CarEntity u where u.username : =username ")
//	public CarEntity getCarByUsername(@Param("username") String username);
	
	public CarEntity findByUsername(String username);
}
