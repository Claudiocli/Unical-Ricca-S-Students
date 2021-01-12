package it.urss.payball8.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, Long>{

}
