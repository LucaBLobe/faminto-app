package server.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import server.models.Pedido;

@Controller
public class PedidoController {

	public ModelAndView criar(Pedido pedido) {
		ModelAndView modelAndView = new ModelAndView("pedido/confirmado");
		
		System.out.println(pedido);

		return modelAndView;
	}

}
