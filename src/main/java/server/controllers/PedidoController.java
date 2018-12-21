package server.controllers;

import java.util.function.Supplier;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
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

	@RequestMapping(value = "/criar", method = RequestMethod.POST)
	public ModelAndView criar(Pedido pedido) {
		ModelAndView modelAndView = new ModelAndView("pedido/confirmado");

		pedido.setStatus(StatusPedido.COZINHA);
		pedido.setProdutos(carrinho.get());

		System.out.println(pedido);

		pedidoDAO.save(pedido);
		
		carrinho.clear();

		return modelAndView;
	}

	@RequestMapping("list")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("pedido/list");

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		Supplier<Stream<? extends GrantedAuthority>> userRolesStreamSuplaier = () -> authentication.getAuthorities().stream();

		if (userRolesStreamSuplaier.get().anyMatch(r -> r.getAuthority().equals("ROLE_COZINHEIRO"))) {
			modelAndView.addObject("pedidosCozinha", pedidoDAO.findByStatus(StatusPedido.COZINHA));

		}

		if (userRolesStreamSuplaier.get().anyMatch(r -> r.getAuthority().equals("ROLE_ENTREGADOR"))) {
			modelAndView.addObject("pedidosEntrega", pedidoDAO.findByStatus(StatusPedido.ENTREGA));
		}

		return modelAndView;
	}

	
	@RequestMapping(value="/pedido/status", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void status(Integer idPedido, StatusPedido status) {
		Pedido pedido = pedidoDAO.findOne(idPedido);
		
		pedido.setStatus(status);
		
		pedidoDAO.save(pedido);
		
		
	}
	
	
}
