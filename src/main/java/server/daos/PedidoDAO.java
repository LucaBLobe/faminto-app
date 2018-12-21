package server.daos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import server.models.Pedido;
import server.models.StatusPedido;


@Repository
public interface PedidoDAO extends CrudRepository<Pedido, Integer> {

		List<Pedido>findByStatus(StatusPedido statusPedido);
	
	
}
