<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cardapio Faminto</title>
<link href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="row">
		<c:forEach items="${ produtos }" var="produto">
			<form action="./carrinho/add" method="POST" id="form_${ produto.id }">

				<input type="hidden" value="${ produto.id }" name="produtoId">
	
				<div class="card" style="width: 18rem; margin: 15px; min-height: 225px">

					<div class="card-body">
						<h5 class="card-title">${produto.nome}</h5>
						<h6 class="card-subtitle mb-2 text-muted">R$ ${produto.preco}</h6>
						<p class="card-text">${produto.descricao}</p>
						<a href="#"
							onclick="document.getElementById('form_${produto.id}').submit();"
							class="card-link">Colocar no Carrinho</a>
					</div>
				</div>
			</form>
		</c:forEach>
	</div>



	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>