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
@RequestMapping(path = "/user")
public class AccountController {
		Logger logger = LoggerFactory.getLogger(AccountController.class);

		@Autowired
		private AccountRepository accountRepository;

		@Autowired
		private JwtUserDetailsService userDetailsService;
		
		@GetMapping(path = "/all")
		@PreAuthorize("hasAuthority('ADMIN')")
		Iterable<Account> getAll() {
			logger.info("USER_ALL");
			return accountRepository.findAll();
		}
		
		@GetMapping(path = "/me")
		public @ResponseBody Account me(Principal principal) {
			logger.info("USER_ME");
			return accountRepository.findByEmail(principal.getName());
		}

		@GetMapping(path = "/{email}")
		public @ResponseBody Account getByUsername(Principal principal, @PathVariable String email) {
			logger.info(String.format("USER_ONE filtered by username = %s", email));
			return accountRepository.findByEmail(email);
		}

		@PostMapping(path = "/add")
		@PreAuthorize("hasAuthority('ADMIN')")
		ResponseEntity<Account> add(@RequestBody Account newUser) {
			logger.info("USER_ADD added user by ENTITY: " + newUser.toString());
			return ResponseEntity.ok(userDetailsService.save(newUser));
		}

		@PutMapping(path = "/update")
		ResponseEntity<Account> update(Principal principal, @RequestBody Account newUser, Optional<Long> id) {
			Account current_user = accountRepository.findByEmail(principal.getName());
			
			if (id.isPresent())
				current_user = accountRepository.findById(id.get())
						.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		
			logger.info("USER_UPDATE updated user with id = " + id + " by ENTITY " + newUser.toString());
			if (newUser.getEmail() != null)
				current_user.setEmail(newUser.getEmail());
			if (newUser.getName() != null)
				current_user.setName(newUser.getName());
			if (newUser.getSurname() != null)
				current_user.setSurname(newUser.getSurname());
			return ResponseEntity.ok(userDetailsService.save(current_user));
		}

		@DeleteMapping(path = "/delete/{id}")
		void deleteById(@RequestParam Long id) {
			logger.info(String.format("USER_DELETE deleted user with id: %d", id));
			accountRepository.deleteById(id);
		}
}
