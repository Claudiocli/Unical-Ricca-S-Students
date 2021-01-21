package it.urss.payball8.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Contribute;

@Transactional
public interface ContributeRepository  extends JpaRepository<Contribute, Long> {
	List<Contribute> findAllBycolletta(Long id);
	List<Contribute> findAllBycontributor(String id);
	Contribute findByContributorAndColletta(String contributor, Long colletta);
	void deleteByContributorAndColletta(String contributor, Long colletta);
}
