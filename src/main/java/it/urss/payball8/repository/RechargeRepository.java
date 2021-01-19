package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Recharge;


public interface RechargeRepository extends JpaRepository<Recharge, Long>  {
	Recharge findByaccount(Long id);
	List<Recharge> findAllByaccount(Long id);
}
