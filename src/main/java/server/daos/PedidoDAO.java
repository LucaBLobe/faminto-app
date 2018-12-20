package server.daos;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import server.models.Pedido;


@Repository
public interface PedidoDAO extends CrudRepository<Pedido, Integer> {

}
