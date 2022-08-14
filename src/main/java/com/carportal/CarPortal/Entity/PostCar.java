package com.carportal.CarPortal.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="PostCar")
public class PostCar {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@NotBlank(message="Field cannot be left blank")
	private String modelname;
	
	@NotBlank(message="Field cannot be left blank")
	private String company;
		
	@NotNull(message="Field cannot be left blank")	
	private int distance;
	
	@NotNull(message="Field cannot be left blank")
	private int year;
	
	@NotNull(message="Field cannot be left blank")
	private long price;
	
	private String image;
	
	private String uploadername;
	
	public PostCar() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getModelname() {
		return modelname;
	}

	public void setModelname(String modelname) {
		this.modelname = modelname;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getUploadername() {
		return uploadername;
	}

	public void setUploadername(String uploadername) {
		this.uploadername = uploadername;
	}

	@Override
	public String toString() {
		return "PostCar [id=" + id + ", modelname=" + modelname + ", company=" + company + ", distance=" + distance
				+ ", year=" + year + ", price=" + price + ", image=" + image + ", uploadername=" + uploadername + "]";
	}

	public PostCar(int id, @NotBlank(message = "Field cannot be left blank") String modelname,
			@NotBlank(message = "Field cannot be left blank") String company,
			@NotNull(message = "Field cannot be left blank") int distance,
			@NotNull(message = "Field cannot be left blank") int year,
			@NotNull(message = "Field cannot be left blank") long price, String image, String uploadername) {
		super();
		this.id = id;
		this.modelname = modelname;
		this.company = company;
		this.distance = distance;
		this.year = year;
		this.price = price;
		this.image = image;
		this.uploadername = uploadername;
	}
	
}
