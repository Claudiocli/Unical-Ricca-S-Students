package it.urss.payball8.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Cart;

public interface CartRepository extends JpaRepository<Cart,Long> {
	
}
