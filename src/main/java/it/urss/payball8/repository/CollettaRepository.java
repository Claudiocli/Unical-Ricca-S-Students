package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Colletta;

public interface CollettaRepository extends JpaRepository<Colletta, Long>{
	Colletta findBybeneficiary(String id);
	List<Colletta> findAllBybeneficiary(String beneficiary);
}
