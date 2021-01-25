package it.urss.payball8.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Colletta;
import it.urss.payball8.model.Contribute;
import it.urss.payball8.model.Transaction;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CollettaRepository;
import it.urss.payball8.repository.ContributeRepository;
import it.urss.payball8.repository.TransactionRepository;

@RestController
@RequestMapping(path = "/contribute")
public class ContributeController {
	Logger logger = LoggerFactory.getLogger(CollettaController.class);

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private CollettaRepository collettaRepository;

	@Autowired
	private ContributeRepository contributeRepository;

	@Autowired
	private TransactionRepository transactionRepository;

	@PostMapping(path = "/pay")
	ResponseEntity<Colletta> payColletta(@RequestBody Contribute contribute) {
		logger.info("COLLETTA_PAY_ID: " + contribute.getColletta());
		Contribute current_contribute = contributeRepository.findByContributorAndColletta(contribute.getContributor(),
				contribute.getColletta());

		Account current_account = accountRepository.findById(current_contribute.getContributor())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		Colletta current_colletta = collettaRepository.findById(current_contribute.getColletta())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find colletta"));

		if (current_account.getBalance() >= current_colletta.getQuote()) {
			current_account.setBalance(current_account.getBalance() - current_colletta.getQuote());
			current_colletta.setAmount_temp(current_colletta.getAmount_temp() + current_colletta.getQuote());
		}
		if (current_colletta.getAmount_temp() >= current_colletta.getAmount())
			sendCollettaTobeneficiary(current_colletta);

		Transaction transaction = new Transaction();
		transaction.setAmount(current_colletta.getQuote());
		transaction.setCategory("Colletta inviata a:" + current_colletta.getBeneficiary());
		transaction.setSender(current_account.getId());
		transaction.setRecipient(current_colletta.getBeneficiary());

		ResponseEntity.ok(transactionRepository.save(transaction));

		ResponseEntity.ok(accountRepository.save(current_account));
		return ResponseEntity.ok(collettaRepository.save(current_colletta));
	}

	@DeleteMapping(path = "/decline")
	void declineContribute(@RequestBody Contribute contribute) {
		logger.info(
				"COLLETTA_DECLINE_ID: " + contribute.getColletta() + " CONTRIBUTOR_ID: " + contribute.getContributor());
		Contribute current_contribute = contributeRepository.findByContributorAndColletta(contribute.getContributor(),
				contribute.getColletta());

		Colletta current_colletta = collettaRepository.findById(current_contribute.getColletta())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find colletta"));

		accountRepository.findById(contribute.getContributor())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		current_colletta.setAmount(current_colletta.getAmount() - current_colletta.getQuote());

		if (current_colletta.getAmount_temp() >= current_colletta.getAmount())
			sendCollettaTobeneficiary(current_colletta);

		contributeRepository.deleteByContributorAndColletta(contribute.getContributor(), contribute.getColletta());
	}

	private void sendCollettaTobeneficiary(Colletta colletta) {
		Account beneficiary = accountRepository.findById(colletta.getBeneficiary()).orElseThrow(
				() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user_beneficiaty"));

		beneficiary.setBalance(beneficiary.getBalance() + colletta.getAmount_temp());

		String list_colletta = "";
		for (Contribute contribute : contributeRepository.findAllBycolletta(colletta.getId())) {
			list_colletta += "id: " + contribute.getContributor() + " , ";
		}

		Transaction transaction = new Transaction();
		transaction.setAmount(colletta.getAmount_temp());
		transaction.setCategory("Colletta ricevuta da: " + list_colletta);
		transaction.setRecipient(colletta.getBeneficiary());
		transaction.setDatetime(colletta.getDatetime());

		ResponseEntity.ok(transactionRepository.save(transaction));

		ResponseEntity.ok(accountRepository.save(beneficiary));
	}

}
