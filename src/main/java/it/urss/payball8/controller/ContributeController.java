package it.urss.payball8.controller;

import java.util.ArrayList;
import java.util.List;

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
import it.urss.payball8.model.Colletta;
import it.urss.payball8.model.Contribute;
import it.urss.payball8.model.Transaction;
import it.urss.payball8.model.WrapperCollettaContribute;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CollettaRepository;
import it.urss.payball8.repository.ContributeRepository;
import it.urss.payball8.repository.TransactionRepository;
import net.minidev.json.JSONObject;

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

	@PostMapping(path = "/all")
	@ResponseBody
	List<WrapperCollettaContribute> getAll(@RequestBody JSONObject id) {
		String id_long = id.getAsString("id");
		logger.info("GET ALL CONTRIBUTE with id:" + id_long);
		List<Contribute> list_contribute = contributeRepository.findAllBycontributor(id_long);
		List<WrapperCollettaContribute> list_wrapper = new ArrayList<WrapperCollettaContribute>();
		for (Contribute contribute : list_contribute) {
			WrapperCollettaContribute wcc = new WrapperCollettaContribute();
			Colletta current_Colletta = collettaRepository.findById(contribute.getColletta())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
			wcc.setColletta(current_Colletta);
			wcc.setContribute(contribute);
			list_wrapper.add(wcc);
		}
		return list_wrapper;
	}

	@PostMapping(path = "/pay")
	@ResponseBody
	ResponseEntity<Colletta> payColletta(@RequestBody JSONObject id) {
		Long id_long = Long.parseLong(id.getAsString("id"));
		Contribute current_contribute = contributeRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find contribute"));

		Account current_account = accountRepository.findById(current_contribute.getContributor())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		Colletta current_colletta = collettaRepository.findById(current_contribute.getColletta())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find colletta"));

		if (current_account.getBalance() >= current_colletta.getQuote()) {
			current_account.setBalance(current_account.getBalance() - current_colletta.getQuote());
			current_colletta.setAmount_temp(current_colletta.getAmount_temp() + current_colletta.getQuote());

			Transaction transaction = new Transaction();
			transaction.setAmount(current_colletta.getQuote());
			transaction.setCategory("Colletta inviata a:" + current_colletta.getBeneficiary());
			transaction.setSender(current_account.getId());
			transaction.setRecipient(current_colletta.getBeneficiary());

			current_contribute.setStato("pagata");

			ResponseEntity.ok(contributeRepository.save(current_contribute));
			ResponseEntity.ok(transactionRepository.save(transaction));
			ResponseEntity.ok(accountRepository.save(current_account));
		} else {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "");
		}
		if (current_colletta.getAmount_temp() >= current_colletta.getAmount()) {
			sendCollettaTobeneficiary(current_colletta);
		}
		return ResponseEntity.ok(collettaRepository.save(current_colletta));
	}

	@PostMapping(path = "/decline")
	@ResponseBody
	ResponseEntity<Contribute> declineContribute(@RequestBody JSONObject id) {
		Long id_long = Long.parseLong(id.getAsString("id"));
		logger.info("COLLETTA_DECLINE_ID:" + id);
		Contribute current_contribute = contributeRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find Contribute"));
		current_contribute.setStato("rifiutata");

		Colletta current_colletta = collettaRepository.findById(current_contribute.getColletta())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find colletta"));

		accountRepository.findById(current_contribute.getContributor())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		current_colletta.setAmount(current_colletta.getAmount() - current_colletta.getQuote());

		if (current_colletta.getAmount_temp() >= current_colletta.getAmount())
			sendCollettaTobeneficiary(current_colletta);

		ResponseEntity.ok(collettaRepository.save(current_colletta));
		return ResponseEntity.ok(contributeRepository.save(current_contribute));
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
