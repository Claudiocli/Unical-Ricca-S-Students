package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Friendship;

public interface FriendshipRepository  extends JpaRepository<Friendship, Long> {
	List<Friendship> findAllByaccount1(Long id);
	List<Friendship> findAllByaccount2(Long id);
}
