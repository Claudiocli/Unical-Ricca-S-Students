package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Contribute;

public interface ContributeRepository  extends JpaRepository<Contribute, Long> {
	List<Contribute> findAllBycolletta(Long id);
}
