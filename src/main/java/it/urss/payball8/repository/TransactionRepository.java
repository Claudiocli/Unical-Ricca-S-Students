package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {
	List<Transaction> findAllBysender(Long id);
	List<Transaction> findAllByrecipient(Long id);
}
