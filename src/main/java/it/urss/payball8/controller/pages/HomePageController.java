package it.urss.payball8.controller.pages;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Friendship;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.FriendshipRepository;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping(path = "/home")
public class HomePageController {
	Logger logger = LoggerFactory.getLogger(HomePageController.class);

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private FriendshipRepository friendshipRepository;

	@PostMapping("")
	Account homePage(@RequestBody JSONObject id) {
		Long id_long = new Long(id.getAsString("id"));
		Account current_user = accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		logger.info("HOMEPAGE_ACCOUNT: " + current_user.getEmail());
		return current_user;
	}

	@PostMapping("/friendship")
	List<Account> listFriendship(@RequestBody JSONObject id) {
		Long id_long = new Long(id.getAsString("id"));
		logger.info("Frind:");
		Account current_user = accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		List<Account> list_account = new ArrayList<Account>();
		List<Friendship> list_friends1 = friendshipRepository.findAllByaccount1(id_long);
		List<Friendship> list_friends2 = friendshipRepository.findAllByaccount2(id_long);
		for (Friendship friend : list_friends1) {
			Account current_account = accountRepository.findById(friend.getAccount2())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
			list_account.add(current_account);
		}
		for (Friendship friend : list_friends2) {
			list_account.add(accountRepository.findById(friend.getAccount1())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user")));
		}

		logger.info("LIST_FRIENDS:" + list_account);
		return list_account;
	}

}
