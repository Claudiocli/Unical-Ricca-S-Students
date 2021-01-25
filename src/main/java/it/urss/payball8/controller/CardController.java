package it.urss.payball8.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Card;
import it.urss.payball8.model.Recharge;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.CardRepository;
import it.urss.payball8.repository.RechargeRepository;
import net.minidev.json.JSONObject;

@Controller
@RequestMapping(path = "/card")
public class CardController {

	Logger logger = LoggerFactory.getLogger(CardController.class);

	@Autowired
	private CardRepository cardRepository;

	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private RechargeRepository rechargeRepository;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showLoginPage() {
		return "carte";
	}

	@PostMapping(path = "/myCard")
	@ResponseBody List<Card> getAllMyCard(@RequestBody JSONObject id) {
		String id_long = id.getAsString("id");
		
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		logger.info("GET ALL MY CARD"+ id_long);
		
		return cardRepository.findAllByAccount(id_long);
	}

	@PostMapping(path = "/add")
	@ResponseBody ResponseEntity<Card> addCard(@RequestBody Card card) {
		accountRepository.findById(card.getAccount())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		logger.info("ADD CARD TO ACCOUNT");
		card.setHolder(card.getHolder().trim().toUpperCase());
		return ResponseEntity.ok(cardRepository.save(card));
	}

	@DeleteMapping(path = "/deleteCard/{id}")
	void deleteBypan(@RequestBody JSONObject pan , @PathVariable String id) {
		String pan_Json = pan.getAsString("pan");
		Card current_card = cardRepository.findBypan(pan_Json);
		List<Recharge> list_recharge = rechargeRepository.findAllBycard(pan_Json);
		if (current_card != null && current_card.getAccount().equals(id)) {
			rechargeRepository.deleteAll(list_recharge);
			cardRepository.delete(current_card);
			logger.info("Cart_DELETE deleted card with pan: " + pan);
			throw new ResponseStatusException(HttpStatus.OK, "DELETE_CARD");
		}
	}
}
