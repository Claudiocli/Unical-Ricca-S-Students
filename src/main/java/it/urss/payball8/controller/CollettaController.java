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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Colletta;
import it.urss.payball8.model.Contribute;
import it.urss.payball8.model.WrapperObject;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CollettaRepository;
import it.urss.payball8.repository.ContributeRepository;
import net.minidev.json.JSONObject;

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
	ResponseEntity<Colletta> createNewColletta(@RequestBody WrapperObject ad) {

		accountRepository.findById(ad.getColletta().getBeneficiary())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		Colletta new_colletta = new Colletta();
		new_colletta.setAmount(ad.getColletta().getQuote() * ad.getList_id().size());
		new_colletta.setBeneficiary(ad.getColletta().getBeneficiary());
		new_colletta.setQuote(ad.getColletta().getQuote());
		new_colletta.setDatetime(ad.getColletta().getDatetime());

		logger.info("CREATE NEW COLLETTA" + new_colletta);
		ResponseEntity<Colletta> responseEntity = ResponseEntity.ok(collettaRepository.save(new_colletta));
		
		for (Long id : ad.getList_id()) {
			accountRepository.findById(id)
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
			Contribute contribute = new Contribute(id, responseEntity.getBody().getId());
			ResponseEntity.ok(contributeRepository.save(contribute));
		}
		return responseEntity;

	}

	@PostMapping(path = "/my")
	List<Colletta> getMyColletta(@RequestBody JSONObject id) {
		logger.info("COLLETTA_ME");
		Long id_long = new Long(id.getAsString("id"));
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		List<Contribute> current_contribute = contributeRepository.findAllBycontributor(id_long);
		List<Colletta> list_colletta = new ArrayList<Colletta>();
		for (Contribute contribute : current_contribute) {
			Colletta current_colletta = collettaRepository.findById(contribute.getColletta())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find colletta"));
			list_colletta.add(current_colletta);
		}
		return list_colletta;
	}

}
