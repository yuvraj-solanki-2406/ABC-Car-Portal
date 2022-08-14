package com.carportal.CarPortal.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class CarEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@NotBlank(message="First Name must not be left blank")
	private String first_name;
	
	@NotBlank(message="Last Name must not be left blank")
	private String last_name;
	
	@NotBlank(message="Email must not be left blank")
	@Email(message="Please enter valid Email (include '@', '.') in Email")
	private String email;
	
	@NotBlank(message="Username must not be left blank")
	@Size(min=3 , max=15 , message="Username must be between 3 to 10 charcters")
	private String username;
	
	@NotBlank(message="Password must not be left blank")
	private String password;
	
	@NotNull(message="Value cannot be left blank")
	private int age;
	
	@NotBlank(message="Gender cannot be left blank")
	private String gender;
	
	@NotBlank(message="Address cannot be left blank")
	private String address;
	
	private String role;
	
	
	public CarEntity() {
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFirst_name() {
		return first_name;
	}


	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}


	public String getLast_name() {
		return last_name;
	}


	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public CarEntity(int id, @NotNull(message = "Value cannot be left blank") String first_name,
			@NotNull(message = "Value cannot be left blank") String last_name,
			@NotNull(message = "Value cannot be left blank") String email,
			@NotNull(message = "Value cannot be left blank") String username,
			@NotNull(message = "Value cannot be left blank") String password,
			@NotNull(message = "Value cannot be left blank") int age,
			@NotNull(message = "Value cannot be left blank") String gender,
			@NotNull(message = "Value cannot be left blank") String address, String role) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.role = role;
	}


	@Override
	public String toString() {
		return "CarEntity [id=" + id + ", first_name=" + first_name + ", last_name=" + last_name + ", email=" + email
				+ ", username=" + username + ", password=" + password + ", age=" + age + ", gender=" + gender
				+ ", address=" + address + ", role=" + role + "]";
	}
	
	
	
	
	
	
}
