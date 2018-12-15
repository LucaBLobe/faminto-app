package server.models;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class Carrinho {

	private List<Produto> carrinho = new ArrayList<>();
	
	public void add(Produto p) {
		carrinho.add(p);
		System.out.println("produtos selecionados" + p);
		System.out.println("Quantidade no carrinho " + carrinho.size());
		
	}
	public List<Produto> get() {
		return carrinho;
	}
}
