package it.urss.payball8.controller;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.repository.AccountRepository;
import net.minidev.json.JSONObject;


@RestController
@RequestMapping(path = "/account")
public class AccountController {

		Logger logger = LoggerFactory.getLogger(AccountController.class);

		@Autowired
		private AccountRepository accountRepository;

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
			logger.info("USER_ADD added user by ENTITY: " + newAccount.toString());
			return ResponseEntity.ok(accountRepository.save(newAccount));
		}
		
		@PutMapping(path = "/update")
		ResponseEntity<Account> update(@RequestBody Account newAccount) {
			Account current_user = accountRepository.findById(newAccount.getId())
						.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

			logger.info("USER_UPDATE updated user with id = " + newAccount.getId() + " by ENTITY " + newAccount.toString());
			if (newAccount.getName() != null)
				current_user.setName(newAccount.getName());
			if (newAccount.getSurname() != null)
				current_user.setSurname(newAccount.getSurname());
			return ResponseEntity.ok(accountRepository.save(current_user));
		}

		@DeleteMapping(path = "/delete/{id}")
		void deleteById(@RequestParam String id) {
			logger.info(String.format("USER_DELETE deleted user with id: %d", id));
			accountRepository.deleteById(id);
		}
}
