package it.urss.payball8.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Card;

public interface CardRepository extends JpaRepository<Card, Long> {
	Card findBypan(Long pan);
}
