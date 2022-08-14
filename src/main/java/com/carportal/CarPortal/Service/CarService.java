package com.carportal.CarPortal.Service;

import java.util.List;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.carportal.CarPortal.Entity.BiddingEntity;
import com.carportal.CarPortal.Entity.CarEntity;
import com.carportal.CarPortal.Entity.PostCar;
import com.carportal.CarPortal.Repository.BiddingRepo;
import com.carportal.CarPortal.Repository.CarRepo;
import com.carportal.CarPortal.Repository.PostCarRepo;

@Service
public class CarService {

	@Autowired
	private CarRepo repo;
	@Autowired
	private PostCarRepo postrepo;
	@Autowired
	private BiddingRepo bidrepo;
	@Autowired
	private PasswordEncoder passwordencoder;
	
	public String saveMemberDetails(@Valid @ModelAttribute("carsDetails") CarEntity cars) {
		cars.setPassword(passwordencoder.encode(cars.getPassword()));
		cars.setRole("USER");
		repo.save(cars);
		return "Memeber added successfully";
	}
	
	public String AddCar(@Valid  @ModelAttribute("postCarDetails") PostCar postcar) {	
		postrepo.save(postcar);
		return"Car Added successfully";
	}
	
	public String BidCar(@Valid  @ModelAttribute("bidCar") BiddingEntity biddingentity ) {		

		bidrepo.save(biddingentity);
		return"Bid Added successfully";
	}
	
	public String SearchCar(@RequestParam("search") PostCar postcar) {
		
		String search = postcar.getModelname();
		postrepo.findByModelnameContaining(search);
		System.out.print(search);
		return "Car Searched";
	}
	
	public List<PostCar> ViewAllCars() {
		List<PostCar> cars = postrepo.findAll();
		return cars;
	}
	
	public List<CarEntity> ViewAllMembers(){
		List<CarEntity> members = repo.findAll();
		return members;
	}
	
	public List<PostCar> Search(String search){
		return postrepo.search(search);
	}

}
