package it.urss.payball8.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Contribute;
import it.urss.payball8.model.Friendship;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.FriendshipRepository;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping(path = "/friendship")
public class FriendshipController {
	Logger logger = LoggerFactory.getLogger(FriendshipController.class);

	@Autowired
	private FriendshipRepository friendshipRepository;

	@Autowired
	private AccountRepository accountRepository;

	@PostMapping(path = "/add")
	ResponseEntity<Friendship> addFriendId(@RequestBody Friendship friendship) {
		logger.info("ADD FRIEND WITH ID");
		return ResponseEntity.ok(friendshipRepository.save(friendship));
	}

	@PostMapping(path = "/all")
	List<Account> listFriendship(@RequestBody JSONObject id) {
		Long id_long = new Long(id.getAsString("id"));
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		List<Account> list_account = new ArrayList<Account>();
		List<Friendship> list_friends1 = friendshipRepository.findAllByaccount1(id_long);
		List<Friendship> list_friends2 = friendshipRepository.findAllByaccount2(id_long);
		for (Friendship friend : list_friends1) {
			list_account.add(accountRepository.findById(friend.getAccount2())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user")));
		}
		for (Friendship friend : list_friends2) {
			list_account.add(accountRepository.findById(friend.getAccount1())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user")));
		}

		logger.info("LIST_FRIENDS:" + list_account);
		return list_account;
	}
	
	@DeleteMapping(path ="/delete/{id_delete}")
	void deleteFriendship(@PathVariable Long id_delete, @RequestBody JSONObject id) {
		logger.info(String.format("FRIENDSHIP_DELETE deleted friendship with id: %d", id_delete));
		friendshipRepository.deleteByAccount1AndAccount2(id_delete, id);
		friendshipRepository.deleteByAccount2AndAccount1(id_delete, id);
	}
	

}
