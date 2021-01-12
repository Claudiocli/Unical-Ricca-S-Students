package it.urss.payball8.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import it.urss.payball8.service.JwtUserDetailsService;


@RestController
@RequestMapping(path = "/account")
public class AccountController {
		Logger logger = LoggerFactory.getLogger(AccountController.class);

		@Autowired
		private AccountRepository accountRepository;

		@Autowired
		private JwtUserDetailsService userDetailsService;
		
		@GetMapping(path = "/all")
		Iterable<Account> getAll() {
			logger.info("USER_ALL");
			return accountRepository.findAll();
		}
		
		@GetMapping(path = "/me/{id}")
		public @ResponseBody Optional<Account> me(Principal principal, @PathVariable Long id) {
			logger.info("USER_ME");
			return accountRepository.findById(id);
		}


		@PutMapping(path = "/update/{id}")
		ResponseEntity<Account> update(Principal principal, @RequestBody Account newAccount, @PathVariable Long id) {
			Account current_user = accountRepository.findById(id)
						.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		
			logger.info("USER_UPDATE updated user with id = " + id + " by ENTITY " + newAccount.toString());
			if (newAccount.getEmail() != null)
				current_user.setEmail(newAccount.getEmail());
			if (newAccount.getName() != null)
				current_user.setName(newAccount.getName());
			if (newAccount.getSurname() != null)
				current_user.setSurname(newAccount.getSurname());
			return ResponseEntity.ok(userDetailsService.save(current_user));
		}

		@DeleteMapping(path = "/delete/{id}") // controllati se l'id di quello loggato è quello che losta eliminado 
		void deleteById(@RequestParam Long id) {
			logger.info(String.format("USER_DELETE deleted user with id: %d", id));
			accountRepository.deleteById(id);
		}
}
