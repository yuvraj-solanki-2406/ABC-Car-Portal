package com.carportal.CarPortal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.carportal.CarPortal.Entity.BiddingEntity;

public interface BiddingRepo extends JpaRepository<BiddingEntity, Integer> {

}
