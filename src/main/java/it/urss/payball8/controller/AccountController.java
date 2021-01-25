package it.urss.payball8.controller;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Card;
import it.urss.payball8.model.Colletta;
import it.urss.payball8.model.Contribute;
import it.urss.payball8.model.Friendship;
import it.urss.payball8.model.Recharge;
import it.urss.payball8.model.Transaction;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CardRepository;
import it.urss.payball8.repository.CollettaRepository;
import it.urss.payball8.repository.ContributeRepository;
import it.urss.payball8.repository.FriendshipRepository;
import it.urss.payball8.repository.RechargeRepository;
import it.urss.payball8.repository.TransactionRepository;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping(path = "/account")
public class AccountController {

	Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private CardRepository cardRepository;

	@Autowired
	private RechargeRepository rechargeRepository;

	@Autowired
	private CollettaRepository collettaRepository;

	@Autowired
	private ContributeRepository contributeRepository;

	@Autowired
	private FriendshipRepository friendshipRepository;

	@Autowired
	private TransactionRepository transactionRepository;

	@PostMapping(path = "/me")
	public @ResponseBody Optional<Account> me(@RequestBody JSONObject id) {
		logger.info("USER_ME");
		String id_long = id.getAsString("id");
		return accountRepository.findById(id_long);
	}

	@PostMapping(path = "/add")
	ResponseEntity<Account> add(@RequestBody Account newAccount) {
		newAccount.setBalance(0.0F);
		newAccount.setName(newAccount.getName().trim().toUpperCase());
		newAccount.setSurname(newAccount.getSurname().trim().toUpperCase());
		newAccount.setEmail(newAccount.getEmail().trim().toUpperCase());
		newAccount.setAddress(newAccount.getAddress().trim().toUpperCase());
		newAccount.setCf(newAccount.getCf().trim().toUpperCase());
		// accountRepository.findById(newAccount.getId())
		// .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable
		// to find user"));
		logger.info("USER_ADD added user by ENTITY: " + newAccount.toString());
		return ResponseEntity.ok(accountRepository.save(newAccount));
	}

	@PutMapping(path = "/update")
	ResponseEntity<Account> update(@RequestBody Account newAccount) {
		Account current_user = accountRepository.findById(newAccount.getId())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		logger.info("USER_UPDATE updated user with id = " + newAccount.getId() + " by ENTITY " + newAccount.toString());
		if (newAccount.getEmail() != null)
			current_user.setEmail(newAccount.getEmail());

		return ResponseEntity.ok(accountRepository.save(current_user));
	}

	@DeleteMapping(path = "/delete")
	void deleteById(@RequestBody JSONObject id_delete) {
		String id = id_delete.getAsString("id");
		logger.info("USER_DELETE deleted user with id: " + id);
		Account current_user = accountRepository.findById(id)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		List<Transaction> transaction_sender_list = transactionRepository.findAllBysender(id);
		transactionRepository.deleteAll(transaction_sender_list);
		List<Transaction> transaction_recipient_list = transactionRepository.findAllByrecipient(id);
		transactionRepository.deleteAll(transaction_recipient_list);

		List<Friendship> friendships_account1_list = friendshipRepository.findAllByaccount1(id);
		friendshipRepository.deleteAll(friendships_account1_list);
		List<Friendship> friendships_account2_list = friendshipRepository.findAllByaccount2(id);
		friendshipRepository.deleteAll(friendships_account2_list);

		List<Contribute> contribute_list = contributeRepository.findAllBycontributor(id);
		contributeRepository.deleteAll(contribute_list);

		List<Colletta> colletta_list = collettaRepository.findAllBybeneficiary(id);
		collettaRepository.deleteAll(colletta_list);

		List<Card> current_card_list = cardRepository.findAllByAccount(id);
		for (Card card : current_card_list) {
			List<Recharge> list_recharge = rechargeRepository.findAllBycard(card.getPan());
			rechargeRepository.deleteAll(list_recharge);
		}
		cardRepository.deleteAll(current_card_list);

		accountRepository.delete(current_user);
	}
}
