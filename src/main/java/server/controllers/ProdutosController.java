package server.controllers;

import java.util.List;

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
		
		List<Produto> findAll = produtoDAO.findAll();
		
		findAll.stream().forEach(produto -> System.out.println(produto));
		
		mv.addObject("produtos", produtoDAO.findAll()); 

		return mv;

	}
}
