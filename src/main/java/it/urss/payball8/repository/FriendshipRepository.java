package it.urss.payball8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import it.urss.payball8.model.Friendship;
import net.minidev.json.JSONObject;

public interface FriendshipRepository  extends JpaRepository<Friendship, Long> {
	List<Friendship> findAllByaccount1(Long id);
	List<Friendship> findAllByaccount2(Long id);
	void deleteByAccount1AndAccount2(Long id_delete, JSONObject id);
	void deleteByAccount2AndAccount1(Long id_delete, JSONObject id);
}
