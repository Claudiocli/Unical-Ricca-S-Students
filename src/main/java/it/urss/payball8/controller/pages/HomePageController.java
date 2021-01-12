package it.urss.payball8.controller.pages;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="")
public class HomePageController
{
	Logger logger = LoggerFactory.getLogger(HomePageController.class);

	@GetMapping("")
	public String index()	{
		return "index";
	}

	@PostMapping("/homepage")
	public String personalHomePage()	{
		return "home";
	}

}
