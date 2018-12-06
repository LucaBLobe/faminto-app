package server.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("*/produtos")
public class ProdutosController {

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView list() {

		return new ModelAndView("produtos/list");

	}
}
