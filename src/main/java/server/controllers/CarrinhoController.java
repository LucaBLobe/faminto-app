package server.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import server.daos.ProdutoDAO;
import server.models.Carrinho;
import server.models.Produto;

@Controller
@RequestMapping("/carrinho")
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoController {

	@Autowired
	private ProdutoDAO produtoDAO;
	@Autowired
	private Carrinho carrinho;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Integer produtoId) {
		ModelAndView modelAndView = new ModelAndView("redirect:/cardapio");

		Produto produto = produtoDAO.findOne(produtoId);
		carrinho.add(produto);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void remove(Integer idProduto) {
		carrinho.remove(idProduto);
	}

	@RequestMapping("checkout")
	public ModelAndView checkout() {
		ModelAndView modelAndView= new ModelAndView(); 
		
		modelAndView.addObject("produtos", carrinho.get());
	
	
	return modelAndView;
	}
}
