package it.urss.payball8.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Card;
import it.urss.payball8.model.Recharge;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CardRepository;
import it.urss.payball8.repository.RechargeRepository;

@RestController
@RequestMapping(path = "/recharge")
public class RechargeController {

	Logger logger = LoggerFactory.getLogger(RechargeController.class);

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private RechargeRepository rechargeRepository;

	@Autowired
	private CardRepository cardRepository;

	@PostMapping(path = "/add")
	@ResponseBody ResponseEntity<Recharge> addRecharge(@RequestBody Recharge recharge) {
		Account current_account = accountRepository.findById(recharge.getAccount()).orElseThrow(
				() -> new ResponseStatusException(HttpStatus.NOT_FOUND, String.format("Unable to find user")));

		Card current_card = cardRepository.findBypan(recharge.getCard());
		if (current_card == null)
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, String.format("Cannot find Card"));
		
		if (!current_card.getAccount().equals(current_account.getId()))
			throw new ResponseStatusException(HttpStatus.NOT_FOUND,
					String.format("Cannot find Card.account.id & Account.id"));

		current_account.setBalance(current_account.getBalance() + recharge.getAmount());
		logger.info("ADD RECHARGE: " + recharge.getAmount());
		ResponseEntity.ok(accountRepository.save(current_account));
		return ResponseEntity.ok(rechargeRepository.save(recharge));
	}

}
