<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Produtos</title>
<link href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">FAMINTO</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link">MENU <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/cardapio">Cardapio</a></li>

			</ul>
		</div>
	</nav>


	<table class="table table-dark">
		<thead>


			<tr>
				<th scope="col">Ação</th>
				<th scope="col">Nome</th>
				<th scope="col">Descrição</th>
				<th scope="col">Preço</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ produtos }" var="produto" varStatus="status">
				<tr id="Linha_${ status.index }">
					<td><button onclick="removerItem(${ produto.id }, ${ status.index })"
							type="button" class="btn-danger">X</button></td>
					<td>${produto.nome }</td>
					<td>${produto.descricao}</td>
					<td>R$ ${produto.preco}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<form action="/pedido/criar" method="POST">
		<div class="container">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Nome</label> <input type="text"
						class="form-control" id="inputEmail4" placeholder="Nome" name="nome">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Data de Nascimento</label> <input
						type="date" class="form-control" id="inputPassword4" name="dataNascimento">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">Endereço</label> <input type="text"
					class="form-control" id="inputAddress" placeholder="Rua..." name="endereço">
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">Cidade</label> <input type="text"
						class="form-control" id="inputCity" name="cidade">
				</div>
				<div class="form-group col-md-4">
					<label for="inputState">Estado</label> <select id="inputState"
						class="form-control" name="estado">
						<option selected>Santa Catarina</option>
					</select>
				</div>
				<div class="form-group col-md-2">
					<label for="inputZip">CEP</label> <input type="number"
						class="form-control" id="inputZip" name="cep">
				</div>
				<div class="form-group">
					<label for="inputdip">Metodo de Pagamento</label>
					<select id="inputdip" class="form-control" name=metodoPagamento>
						<option selected value="DINHEIRO">Dinheiro</option>
						<option value="CARTAO_CREDITO">Cartão de Crédito</option>
						<option value="VALE_ALIMENTACAO">Vale Alimentação</option>
					</select>
				</div>
				
			</div>
			<div class="form-group"></div>
		</div>
		<button type="submit" class="btn btn-primary">Comfirmar</button>

	</form>
	<script>
	
	function removerItem(idProduto, index) {
		$.post('/carrinho/remove', {'idProduto' : idProduto}, function() {
			$('#Linha_'+ index).hide();
		});
	}
	
	</script>
	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</html>