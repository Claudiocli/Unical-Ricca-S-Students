package it.urss.payball8.controller.pages;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import it.urss.payball8.model.Account;
import it.urss.payball8.model.Friendship;
import it.urss.payball8.repository.AccountRepository;
import it.urss.payball8.repository.FriendshipRepository;
import net.glxn.qrgen.QRCode;
import net.minidev.json.JSONObject;

@Controller
public class HomePageController {
	Logger logger = LoggerFactory.getLogger(HomePageController.class);

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private FriendshipRepository friendshipRepository;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String redirectToLogin() {
		return "Login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage() {
		return "Login";
	}

	@RequestMapping(value = "/aiuto", method = RequestMethod.GET)
	public String showHelpPage() {
		return "Aiuto";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String showIndexPage() {
		return "index";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String showHomePage() {
		return "Home";
	}

	@PostMapping("home/me")
	Account homePage(@RequestBody JSONObject id) {
		String id_long = id.getAsString("id");
		Account current_user = accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));
		logger.info("HOMEPAGE_ACCOUNT: " + current_user.getEmail());
		return current_user;
	}

	@PostMapping("home/friendship")
	@ResponseBody
	List<Account> listFriendship(@RequestBody JSONObject id) {
		String id_long = id.getAsString("id");
		accountRepository.findById(id_long)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user"));

		List<Account> list_account = new ArrayList<Account>();
		List<Friendship> list_friends1 = friendshipRepository.findAllByaccount1(id_long);
		List<Friendship> list_friends2 = friendshipRepository.findAllByaccount2(id_long);
		for (Friendship friend : list_friends1)
			list_account.add(accountRepository.findById(friend.getAccount2())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user")));
		for (Friendship friend : list_friends2)
			list_account.add(accountRepository.findById(friend.getAccount1())
					.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Unable to find user")));

		logger.info("LIST_FRIENDS:" + list_account);
		return list_account;
	}

	@PostMapping("/QrCode")
	public ResponseEntity<byte[]> getQRCodeImageById(@RequestBody JSONObject id) {
		String id_long = id.getAsString("id");
		logger.info("GET QR_CODE" +id_long);
		ByteArrayOutputStream stream = QRCode.from(id_long).stream();
		byte[] data = stream.toByteArray();

		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(data, headers, HttpStatus.CREATED);
	}

}
