package it.urss.payball8.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Friendship;

@Transactional
public interface FriendshipRepository  extends JpaRepository<Friendship, String> {
	List<Friendship> findAllByaccount1(String id);
	List<Friendship> findAllByaccount2(String id);
	void deleteByAccount1AndAccount2(String id_delete, String id);
	void deleteByAccount2AndAccount1(String id_delete, String id);
	Friendship findByAccount1AndAccount2(String id_delete, String id);
	Friendship findByAccount2AndAccount1(String id_delete, String id);
}
