package it.urss.payball8.controller;


import java.security.Principal;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.service.JwtUserDetailsService;
import net.minidev.json.JSONObject;


@RestController
@RequestMapping(path = "/account")
public class AccountController {
	
		Logger logger = LoggerFactory.getLogger(AccountController.class);

		@Autowired
		private AccountRepository accountRepository;

		@Autowired
		private JwtUserDetailsService userDetailsService;

		@GetMapping(path = "/me")
		public @ResponseBody Optional<Account> me(@RequestBody JSONObject id) {
		
			logger.info("USER_ME");
			Long id_long = new Long(id.getAsString("id"));
			return accountRepository.findById(id_long);

		@PostMapping(path = "/add")
		ResponseEntity<Account> add(@RequestBody Account newAccount) {
			/*if(newAccount != null)
				newAccount.setId(castUUID(newAccount.getId());
			*/
			logger.info("USER_ADD added user by ENTITY: " + newAccount.toString());
			return ResponseEntity.ok(userDetailsService.save(newAccount));
		}

		@PutMapping(path = "/update")
		ResponseEntity<Account> update(@RequestBody Account newAccount) {
			Account current_user = accountRepository.findById(newAccount.getId())
						.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

			logger.info("USER_UPDATE updated user with id = " + newAccount.getId() + " by ENTITY " + newAccount.toString());
			if (newAccount.getEmail() != null)
				current_user.setEmail(newAccount.getEmail());
			if (newAccount.getName() != null)
				current_user.setName(newAccount.getName());
			if (newAccount.getSurname() != null)
				current_user.setSurname(newAccount.getSurname());
			return ResponseEntity.ok(userDetailsService.save(current_user));
		}

		@DeleteMapping(path = "/delete/{id}") // controllati se l'id di quello loggato è quello che losta eliminado
		void deleteById(@RequestParam String id) {
			logger.info(String.format("USER_DELETE deleted user with id: %d", id));
			accountRepository.deleteById(Long.parseLong(id));
		}
		
		private UUID castUUID(Long id) {
			return UUID.fromString(id.toString());
		}
}
