package it.urss.payball8.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Friendship;

@Transactional
public interface FriendshipRepository  extends JpaRepository<Friendship, Long> {
	List<Friendship> findAllByaccount1(Long id);
	List<Friendship> findAllByaccount2(Long id);
	void deleteByAccount1AndAccount2(Long id_delete, Long id);
	void deleteByAccount2AndAccount1(Long id_delete, Long id);
}
