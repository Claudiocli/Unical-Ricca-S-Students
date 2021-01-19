package it.urss.payball8.controller.routing;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PageRouter
{

	@GetMapping("/login")
	public String getLogin()	{
		return "Login";
	}

	@GetMapping("/home")
	public String getHome()	{
		return "Home";
	}

	@GetMapping("/index")
	public String getIndex()	{
		return "index";
	}

	@GetMapping("/help")
	public String gethelp()	{
		return "Aiuto";
	}

	@GetMapping("/history")
	public String getHistory()	{
		return "Storico";
	}

	@GetMapping("/cards")
	public String getCards()	{
		return "Carte";
	}

}
