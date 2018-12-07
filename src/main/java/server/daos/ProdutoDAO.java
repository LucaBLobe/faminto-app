package server.daos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import server.models.Produto;

@Repository
public interface ProdutoDAO extends CrudRepository<Produto, Integer> {

	public List<Produto> findAll();
}
