package it.urss.payball8.controller;

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
import it.urss.payball8.model.Colletta;
import it.urss.payball8.model.Contribute;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CollettaRepository;
import it.urss.payball8.repository.ContributeRepository;

@RestController
@RequestMapping(path = "/colletta")
public class CollettaController {
	Logger logger = LoggerFactory.getLogger(CollettaController.class);

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private CollettaRepository collettaRepository;

	@Autowired
	private ContributeRepository contributeRepository;

	@PostMapping(path = "/new")
	void createNewColletta(@RequestBody Colletta colletta, @RequestBody List<Long> list_id) {
		
		Colletta new_colletta = new Colletta();
		new_colletta.setAmount(colletta.getQuote() * list_id.size());
		new_colletta.setBeneficiary(colletta.getBeneficiary());
		new_colletta.setQuote(colletta.getQuote());
		new_colletta.setDatetime(colletta.getDatetime());
		logger.info("CREATE NEW COLLETTA" + new_colletta.getId());
		
		
		
	}

	@PostMapping(path = "/addContribute/{id_colletta}")
	void addListAccountToColletta(@RequestBody List<Long> list_id, @PathVariable Long id_colletta) {
		Colletta current_colletta = collettaRepository.findById(id_colletta)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		for (Long id : list_id) {
			Account current_account = accountRepository.findById(id)
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
			Contribute contribute = new Contribute(id, id_colletta);
			ResponseEntity.ok(contributeRepository.save(contribute));
		}
	}

}
