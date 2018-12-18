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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">FAMINTO</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" >MENU <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="carrinho/checkout">Checkout</a>
      </li>
      
    </ul>
  </div>
</nav>



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