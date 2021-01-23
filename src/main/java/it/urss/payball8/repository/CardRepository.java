package it.urss.payball8.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Card;

@Transactional
public interface CardRepository extends JpaRepository<Card, String> {
	Card findBypan(String pan);
	List<Card> findAllByAccount(String id);
	void deleteBypan(String pan);
}
