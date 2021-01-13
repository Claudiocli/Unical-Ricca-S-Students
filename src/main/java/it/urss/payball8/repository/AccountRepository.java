package it.urss.payball8.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {
	Account findByEmail(String email);
}
