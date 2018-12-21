<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Pedidos</title>
<link href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"
        rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Faminto</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/cardapio">Cardápio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/carrinho/checkout">Checkout</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Telas administrativas
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Cozinheiro</a>
          <a class="dropdown-item" href="#">Entregador</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Admin
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Lista de produtos</a>
          <a class="dropdown-item" href="#">Adicionar novo produto</a>
        </div>
      </li>
    </ul>
  </div>
</nav>


<c:forEach items="${ pedidosCozinha }" var="pedido">
	<div class="container">
		<div class="card">
		  <h5 class="card-header">${ pedido.nome }</h5>
		  <div class="card-body">
		 		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Nome</th>
			      <th scope="col">Descrição</th>
			    </tr>
			  </thead>
			  <tbody>
			
				<c:forEach items="${ pedido.produtos }" var="produto">  
				    <tr>
				      <td>${ produto.nome }</td>
				      <td>${ produto.descricao }</td>
				    </tr>
			  	</c:forEach>
			  </tbody>
			</table>
		    <button onclick="alteralStatus(${ pedido.id }, 'ENTREGA')" class="btn btn-primary">Enviar para Entrega</button>
		  </div>
		</div>
	</div>

</c:forEach>

<c:forEach items="${ pedidosEntrega }" var="pedido">
	<div class="container">
		<div class="card">
		  <h5 class="card-header">${ pedido.nome }</h5>
		  <div class="card-body">
		 		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Endereço</th>
			      <th scope="col">Cidade</th>
			       <th scope="col">cep</th>
			      <th scope="col">Método de pagamento</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>${ pedido.endereço }</td>
			      <td>${ pedido.cidade }</td>
			       <td>${ pedido.cep }</td>
			      <td>${ pedido.metodoPagamento }</td>
			    </tr>
			  </tbody>
			</table>
		    <button onclick="alteralStatus(${ pedido.id }, 'FINALIZADO')" class="btn btn-primary">Pedido Entregue</button>
		  </div>
		</div>
	</div>

</c:forEach>

	<script>
	
	function removerItem(idProduto, status) {
		$.post('/pedido/status', {'idProduto' : idProduto}, function() {
			location.reload();
		});
	}
	
	</script>

<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>