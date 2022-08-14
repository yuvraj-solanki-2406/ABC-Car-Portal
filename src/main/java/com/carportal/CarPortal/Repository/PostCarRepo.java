package com.carportal.CarPortal.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.carportal.CarPortal.Entity.PostCar;

@Repository
public interface PostCarRepo extends JpaRepository<PostCar, Integer> {

	public PostCar findByModelnameContaining(String modelname);
	public PostCar findByPrice(long price);
	public PostCar findByYear(int year);
	
	@Query(value="SELECT * FROM post_car WHERE MATCH(company, modelname) AGAINST (?1) ", nativeQuery=true)
	public List<PostCar> search (String search);
	
}
