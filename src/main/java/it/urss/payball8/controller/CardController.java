package it.urss.payball8.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Card;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CardRepository;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping(path = "/card")
public class CardController {

	Logger logger = LoggerFactory.getLogger(CardController.class);

	@Autowired
	private CardRepository cardRepository;

	@Autowired
	private AccountRepository accountRepository;

	@PostMapping(path = "/myCard")
	List<Card> getAllMyCard(@RequestBody JSONObject id) {
		logger.info("GET ALL MY CARD");
		Long id_long = new Long(id.getAsString("id"));
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		return cardRepository.findAllByaccount(id_long);
	}

	@PostMapping(path = "/addCard")
	Card addCard(@RequestBody Card card) {
		logger.info("ADD CARD TO ACCOUNT");
		Card current_card = cardRepository.findBypan(card.getPan());
		if (current_card == null)
			return cardRepository.save(card);

		throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
				String.format("The unable add Card with this pan:" + card.getPan() + ", is already present"));
	}

	@DeleteMapping(path = "/deleteCard/{id}")
	void deleteBypan(@RequestBody String pan, @PathVariable Long id) {
		logger.info(String.format("USER_DELETE deleted card with pan: %d", pan));

		Card current_card = cardRepository.findBypan(pan);
		if (current_card.getAccount() == id)
			cardRepository.deleteBypan(pan);
	}

}
