package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Card;

public interface CardRepository extends JpaRepository<Card, Long> {
	Card findBypan(String pan);
	List<Card> findAllByaccount(Long id);
	void deleteBypan(String pan);
}
