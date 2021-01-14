package it.urss.payball8.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Transaction;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.TransactionRepository;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping(path = "/transaction")
public class TransactionController {

	Logger logger = LoggerFactory.getLogger(TransactionController.class);

	@Autowired
	private TransactionRepository transactionRepository;

	@Autowired
	private AccountRepository accountRepository;

	@PostMapping(path = "")
	int getAll(@RequestBody JSONObject id) {
		Long id_long = new Long(id.getAsString("id"));
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		logger.info("GET TRANSACTION"); 
		
		List<Transaction> list_transaction = new ArrayList<Transaction>();

		list_transaction.addAll(transactionRepository.findAllBysender(id_long));
		list_transaction.addAll(transactionRepository.findAllByrecipient(id_long));

		return list_transaction.size();
	}

	@PostMapping(path = "/getColumn/{indexColumn}")
	List<Transaction> getColumnTransaction(@RequestBody JSONObject id, @PathVariable int indexColumn) {
		Long id_long = new Long(id.getAsString("id"));
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		logger.info("GET COLUMN TRANSACTION"); 
		
		List<Transaction> list_transaction = new ArrayList<Transaction>();

		list_transaction.addAll(transactionRepository.findAllBysender(id_long));
		list_transaction.addAll(transactionRepository.findAllByrecipient(id_long));

		int startIndex = indexColumn * 10;
		int endIndex = startIndex + 9;
		if (endIndex > list_transaction.size())
			endIndex = list_transaction.size();

		return list_transaction.subList(startIndex, endIndex);
	}

	@PostMapping(path = "/send")
	ResponseEntity<Transaction> sendTransaction(@RequestBody Transaction transaction) {
		
		Account account_sender = accountRepository.findById(transaction.getSender())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user sender"));
		Account account_recipient = accountRepository.findById(transaction.getSender())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user recipient"));
		
		logger.info("SEND TRANSACTION"); 
		
		if(account_sender.getBalance() >= transaction.getAmount()) {
			account_sender.setBalance(account_sender.getBalance() - transaction.getAmount());
			account_recipient.setBalance(account_recipient.getBalance() + transaction.getAmount());
		} else {
			new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable send this amount to the user recipient, you don't have enough balance");
		}
		
		ResponseEntity.ok(accountRepository.save(account_sender));
		ResponseEntity.ok(accountRepository.save(account_recipient));
		
		return ResponseEntity.ok(transactionRepository.save(transaction));
	}
}
