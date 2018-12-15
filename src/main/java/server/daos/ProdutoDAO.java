package server.daos;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import server.models.Produto;

@Repository
public interface ProdutoDAO extends CrudRepository<Produto, Integer> {

}
