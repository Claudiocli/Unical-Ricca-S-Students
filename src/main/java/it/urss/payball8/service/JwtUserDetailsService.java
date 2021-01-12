package it.urss.payball8.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import it.urss.payball8.model.Account;
import it.urss.payball8.repository.AccountRepository;


@Service("userDetailsService")
public class JwtUserDetailsService implements UserDetailsService {

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private PasswordEncoder bcryptEncoder;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		Account account = accountRepository.findByEmail(email);
		if (account == null)
			throw new UsernameNotFoundException("User not found with username: " + account);
		
		return new MyUserPrincipal(account);
	}

	public Account save(Account newAccount) {
		newAccount.setPassword(bcryptEncoder.encode(newAccount.getPassword()));
		return accountRepository.save(newAccount);
	}
	@Bean
	public PasswordEncoder encoder() {
	    return new BCryptPasswordEncoder();
	}
}