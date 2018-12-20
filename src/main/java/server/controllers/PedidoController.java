package server.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import server.daos.PedidoDAO;
import server.models.Carrinho;
import server.models.Pedido;
import server.models.StatusPedido;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/pedido")
public class PedidoController {
	
	@Autowired
	private PedidoDAO pedidoDAO;

	@Autowired
	private Carrinho carrinho;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("produtos/list");
		
		mv.addObject("pedidos", pedidoDAO.findAll()); 

		return mv;
	}
	
	@RequestMapping(value = "/criar", method = RequestMethod.POST)
	public ModelAndView criar(Pedido pedido) {
		ModelAndView modelAndView = new ModelAndView("pedido/confirmado");
		
		pedido.setStatus(StatusPedido.COZINHA);
		pedido.setProdutos(carrinho.get());
		
		
		System.out.println(pedido);
		
		pedidoDAO.save(pedido);

		return modelAndView;
	}

}
