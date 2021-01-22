package it.urss.payball8.controller.pages;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ErrorPageController implements ErrorController {

	@Override
	public String getErrorPath() {
		return "/error";
	}

	@RequestMapping("/error")
	@ResponseBody
	public String handleError(HttpServletRequest request) {
		// get error status
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		// TODO: log error details here

		if (status != null) {
			int statusCode = Integer.parseInt(status.toString());

			// display specific error page
			if (statusCode == HttpStatus.NOT_FOUND.value())
				return "404";
			else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value())
				return "500";
			else if (statusCode == HttpStatus.FORBIDDEN.value())
				return "403";
		}

		// display generic error
		return "error";
	}
}