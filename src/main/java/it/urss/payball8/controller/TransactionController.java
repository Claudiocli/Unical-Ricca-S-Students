package it.urss.payball8.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Recharge;
import it.urss.payball8.model.Transaction;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.RechargeRepository;
import it.urss.payball8.repository.TransactionRepository;
import net.minidev.json.JSONObject;

@Controller
@RequestMapping(path = "/storico")
public class TransactionController {

	Logger logger = LoggerFactory.getLogger(TransactionController.class);

	@Autowired
	private TransactionRepository transactionRepository;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private RechargeRepository rechargeRepository;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showStoricoPage() {
		return "Storico";
	}

	@PostMapping(path = "/size")
	int getAll(@RequestBody JSONObject id) {
		String id_long = id.getAsString("id");
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		logger.info("GET TRANSACTION");

		List<Transaction> list_transaction = new ArrayList<Transaction>();

		list_transaction.addAll(transactionRepository.findAllBysender(id_long));
		list_transaction.addAll(transactionRepository.findAllByrecipient(id_long));

		return list_transaction.size();
	}

	@PostMapping(path = "/getColumn/{page}")
	List<Transaction> getColumnTransaction(@RequestBody JSONObject id, @PathVariable Integer page) {
		String id_long = id.getAsString("id");
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		logger.info("GET COLUMN TRANSACTION");

		List<Transaction> list_transaction = new ArrayList<Transaction>();

		for (Transaction transaction : transactionRepository.findAllBysender(id_long)) {
			transaction.setAmount(transaction.getAmount() * -1);
			list_transaction.add(transaction);
		}
		list_transaction.addAll(transactionRepository.findAllByrecipient(id_long));

		for (Recharge recharge : rechargeRepository.findAllByaccount(id_long)) {
			Transaction transaction = new Transaction();
			transaction.setAmount(recharge.getAmount());
			transaction.setCategory("RECHARGE");
			transaction.setRecipient(id_long);
			transaction.setDatetime(recharge.getDatetime());
			list_transaction.add(transaction);
		}

		int startIndex = page * 10;
		int endIndex = startIndex + 9;
		if (endIndex > list_transaction.size())
			endIndex = list_transaction.size();

		return list_transaction.subList(startIndex, endIndex);
	}

	@PostMapping(path = "/send")
	ResponseEntity<Transaction> sendTransaction(@RequestBody Transaction transaction) {
		Account account_sender = accountRepository.findById(transaction.getSender())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user sender"));
		Account account_recipient = accountRepository.findById(transaction.getRecipient())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user recipient"));

		if (account_sender.getBalance() >= transaction.getAmount()) {
			account_sender.setBalance(account_sender.getBalance() - transaction.getAmount());
			account_recipient.setBalance(account_recipient.getBalance() + transaction.getAmount());

			logger.info("SALDO_AGGIORNATO");

			ResponseEntity.ok(accountRepository.save(account_sender));
			ResponseEntity.ok(accountRepository.save(account_recipient));
			return ResponseEntity.ok(transactionRepository.save(transaction));
		} else
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
					"Unable send this amount to the user recipient, you don't have enough balance");
	}

}
