package com.carportal.CarPortal.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class BiddingEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int bidid;
	
	private int buyerid;
	private int sellerid;
	
	@NotBlank(message="Name cannot be left blank")
	private String name;
	
	@NotNull
	private String date;
	private int price;
	
	public BiddingEntity() {
		
	}

	public int getBidid() {
		return bidid;
	}

	public void setBidid(int bidid) {
		this.bidid = bidid;
	}

	public int getBuyerid() {
		return buyerid;
	}

	public void setBuyerid(int buyerid) {
		this.buyerid = buyerid;
	}

	public int getSellerid() {
		return sellerid;
	}

	public void setSellerid(int sellerid) {
		this.sellerid = sellerid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public BiddingEntity(int bidid, int buyerid, int sellerid,
			@NotBlank(message = "Name cannot be left blank") String name, @NotNull String date, int price) {
		super();
		this.bidid = bidid;
		this.buyerid = buyerid;
		this.sellerid = sellerid;
		this.name = name;
		this.date = date;
		this.price = price;
	}

	@Override
	public String toString() {
		return "BiddingEntity [bidid=" + bidid + ", buyerid=" + buyerid + ", sellerid=" + sellerid + ", name=" + name
				+ ", date=" + date + ", price=" + price + "]";
	}

	
	
}