package server.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import server.daos.ProdutoDAO;
import server.models.Produto;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutoDAO produtoDAO;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("produtos/list");
		
		mv.addObject("produtos", produtoDAO.findAll()); 

		return mv;

	}
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView form() {
		return new ModelAndView("produtos/form");
	}
	
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public ModelAndView save(Produto produto) {
		produtoDAO.save(produto);
		
		return new ModelAndView("redirect:/produtos");
		
	}
	
	
	
	
}
