package com.carportal.CarPortal.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException.Forbidden;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carportal.CarPortal.Entity.BiddingEntity;
import com.carportal.CarPortal.Entity.CarEntity;
import com.carportal.CarPortal.Entity.PostCar;
import com.carportal.CarPortal.Repository.CarRepo;
import com.carportal.CarPortal.Repository.PostCarRepo;
import com.carportal.CarPortal.Service.CarService;

@Controller
public class CarController {
	
	CarEntity cars;	
	
	@Autowired
	private CarService service;

	@Autowired
	private CarRepo repo;
	
	@Autowired
	private PostCarRepo postrepo;

	
	@GetMapping(value = "/")
	public String home() {
		System.out.println("Car Portal working");
		return "Home";
	}

	@GetMapping(value = "/registration")
	public String registration(@ModelAttribute("carsDetails") CarEntity cars, Model model) {
		model.addAttribute("message", "You have been registered Successfully!! ");
		return "Register";
	}

	@PostMapping(value = "/register")
	public String Registered(@Valid  @ModelAttribute("carsDetails") CarEntity cars ,
							BindingResult result, Model model, HttpSession session ) {
		if (result.hasErrors()) {
			return "Register";
		} else {
			service.saveMemberDetails(cars);
			session.setAttribute("message", new CarEntity());
			return "Register";
		}
	}
	
	@GetMapping(value="/search")
	public String Search(@Param("search") String search, Principal principal, Model model, CarEntity entity)
							
	{
		System.out.println("search for "+ search);
		List<PostCar> searchResult = service.Search(search);		
		
		model.addAttribute("search", search);
		model.addAttribute("searchResult", searchResult);
		
		if(entity.getRole()=="USER" || entity.getRole()=="ADMIN") {
			String name = principal.getName();	
			CarEntity cars = repo.findByUsername(name);
			model.addAttribute("userDetails", cars);
		}			
				
		return "SearchPage";		
	}
	
	@GetMapping(value="/login")
	public String Login() {
		return "Login";		
	}
	
	@GetMapping(value="/loginfailed")
	public String LoginFailed() {
		return "LoginFailed";		
	}
	
	@GetMapping(value="/user")
	public String userPage(Principal principal, Model model) {
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("userDetails", cars);
		return "UserPage";
	}
		
	@GetMapping(value="/user/postCar")
	public String CarPostingForm(Principal principal, Model model,
					@ModelAttribute("postCarDetails") PostCar postcar) {
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("userDetails", cars);
		return "CarPostingForm";
	}
	
	@PostMapping(value = "/user/postCarDetails")
	public String PostCarDetails(@Valid  @ModelAttribute("postCarDetails") PostCar postcar,
//								 @RequestParam("image") MultipartFile image, 
								 BindingResult result, Principal principal  ) {
				
				
		if (result.hasErrors()) {
			return "CarPostingForm";
		} else {
			
				
//				try {
//					postcar.setImage(image.getOriginalFilename());
//					
//					File file = new ClassPathResource("static/Images").getFile();
//					
//					Path path = Paths.get(file.getAbsolutePath()+File.separator+image.getOriginalFilename());
//					
//					Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//					
//					System.out.println("Image is Uploaded");
//					
//				} catch (IOException e) {
//					System.out.println("Image is Not Uploaded");
//					e.printStackTrace();
//				}

				String loggedinName = principal.getName();					
				postcar.setUploadername(loggedinName);		
				
				service.AddCar(postcar);
				
				
			return "redirect:/user";
		}
		
	}
	
	@GetMapping(value="/user/viewallCars")
	public ModelAndView SeeAllCars(Principal principal, Model model) {
		String name = principal.getName();	
		CarEntity car = repo.findByUsername(name);
		model.addAttribute("userDetails", car);
		
		List<PostCar> cars = service.ViewAllCars();
		return new ModelAndView("ViewCars","carsDetails",cars);
	}
	
	@GetMapping(value="/user/update/{id}")
	public String UpdateMemberUser(@PathVariable("id") int id ,Model model, Principal principal) {		
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("adminDetails", cars);
		
		System.out.println(id);
		Optional<CarEntity> uMember = repo.findById(id);		
		model.addAttribute("updateMember", uMember);
		return "UpdateMemberPageUsers";
	}
	
	@PostMapping(value="/user/updateDetails")
	public ModelAndView UpdateMemberDetailsUsers(@ModelAttribute("updateMember") CarEntity cars) {
		int memberId = cars.getId();
		

		CarEntity uMember = repo.findById(memberId).orElse(cars);
		uMember.setFirst_name(cars.getFirst_name());
		uMember.setLast_name(cars.getLast_name());
		uMember.setEmail(cars.getEmail());
		uMember.setUsername(cars.getUsername());
		uMember.setAge(cars.getAge());
		uMember.setAddress(cars.getAddress());

		repo.save(uMember);
				
		return new ModelAndView ("redirect:/user");
	}
		
	
//	Admin Part
	
		
	@GetMapping(value="/admin")
	public String adminPage(Principal principal, Model model) {
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("adminDetails", cars);
		return "AdminPage";
	}
	
	@GetMapping(value="/admin/postCar")
	public String CarPostingFormAdmin(Principal principal, Model model,
					@ModelAttribute("postCarDetails") PostCar postcar) {
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("userDetails", cars);
		return "CarPostingFormAdmin";
	}
	
	@PostMapping(value = "/admin/postCarDetails")
	public String PostCarDetailsAdmin(@Valid  @ModelAttribute("postCarDetails") PostCar postcar,
		BindingResult result) {
		if (result.hasErrors()) {
			return "CarPostingForm";
		} else {
			service.AddCar(postcar);
			return "AdminPage";
		}
	}
	
	@GetMapping(value="/admin/viewallCars")
	public ModelAndView SeeAllCarsAdmin(Principal principal, Model model) {
		String name = principal.getName();	
		CarEntity car = repo.findByUsername(name);
		model.addAttribute("userDetails", car);
		
		List<PostCar> cars = service.ViewAllCars();
		return new ModelAndView("ViewCarsAdmin","carsDetails",cars);
	}
	
	@GetMapping(value="/admin/viewallmembers")
	public ModelAndView SeeAllmembersAdmin(Principal principal, Model model) {
		String name = principal.getName();	
		CarEntity car = repo.findByUsername(name);
		model.addAttribute("userDetails", car);
		
		List<CarEntity> members = service.ViewAllMembers();
		return new ModelAndView("ViewMember","membersDetails",members);
	}
	
	@GetMapping(value="/delete/{id}")
	public String DeleteMember(@PathVariable("id") int id ,CarEntity carentity) {
		id = carentity.getId();
		System.out.println(id);
		repo.deleteById(id);
		return "AdminPage";
	}
	
	@GetMapping(value="/update/{id}")
	public String UpdateMember(@PathVariable("id") int id ,Model model, Principal principal) {		
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("adminDetails", cars);
		
		System.out.println(id);
		Optional<CarEntity> uMember = repo.findById(id);		
		model.addAttribute("updateMember", uMember);
		return "UpdateMemberPage";
	}
	
	@PostMapping(value="/admin/updateDetails")
	public ModelAndView UpdateMemberDetails(@ModelAttribute("updateMember") CarEntity cars) {
		int memberId = cars.getId();
		

		CarEntity uMember = repo.findById(memberId).orElse(cars);
		uMember.setFirst_name(cars.getFirst_name());
		uMember.setLast_name(cars.getLast_name());
		uMember.setEmail(cars.getEmail());
		uMember.setUsername(cars.getUsername());
		uMember.setAge(cars.getAge());
		uMember.setAddress(cars.getAddress());

		repo.save(uMember);
				
		return new ModelAndView ("redirect:/admin");
	}
	
	@GetMapping(value="/admin/car/update/{id}")
	public String UpdateCarDetails(@PathVariable("id") int id, Model model, Principal principal ) {
		String name = principal.getName();	
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("userDetails", cars);
		
		Optional<PostCar> updateCar = postrepo.findById(id);
		model.addAttribute("updateCarDetails", updateCar);
		return "UpdateCarPage";
	}
	
	@PostMapping(value="/admin/updateCarDetails")
	public ModelAndView updatedCarDetails(@ModelAttribute("updateCarDetails") PostCar postcar) {

		int updatecarid = postcar.getId();

		PostCar updateCar = postrepo.findById(updatecarid).orElse(postcar);
		
		updateCar.setModelname(postcar.getModelname());
		updateCar.setCompany(postcar.getCompany());
		updateCar.setDistance(postcar.getDistance());
		updateCar.setPrice(postcar.getPrice());
		postrepo.save(updateCar);		
		
		return new ModelAndView("redirect:/admin/viewallCars  ");
	}
	
	@GetMapping(value="/user/buy/{id}")
	public String buy(@PathVariable("id") int id ,@ModelAttribute("bidCar") BiddingEntity bidentity,PostCar post,
						Principal principal, Model model) {		
		
		String name = principal.getName();
		CarEntity cars = repo.findByUsername(name);
		model.addAttribute("userDetails", cars);
		
		int ids = post.getId();
//		System.out.println(id+" "+ids);
		bidentity.setSellerid(ids);
		
		Optional<CarEntity> uMember = repo.findById(id);		
		model.addAttribute("sellerid", uMember);
		
		return "Bidding";
	}
	
	@PostMapping(value="/user/boughtCar")
	public String saveBidding(@Valid BiddingEntity biddingentity,Principal principal, PostCar post, Model model) {
		String username = principal.getName();
		CarEntity cars = repo.findByUsername(username);
		model.addAttribute("userDetails", cars);
		
		String pattern = "dd/mm/yyyy";
		SimpleDateFormat simpledateformat = new SimpleDateFormat(pattern);
		simpledateformat.format(new Date());
		
		biddingentity.setDate(String.valueOf(biddingentity.getDate()));
		
		biddingentity.setBuyerid(cars.getId());

		service.BidCar(biddingentity);
		model.addAttribute("biddingUserDetails", biddingentity);
		
		return "BiddingConfirmation";
	}
	
	
	
	
	@ResponseStatus(value=HttpStatus.FORBIDDEN)
	@ExceptionHandler(value=Forbidden.class)
	public String Exceptions() {
		
		return "LoginFailed";
	}
	
	
	
}


