<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

      <sec:authorize access="hasRole('ADMIN') or hasRole('COZINHEIRO') or hasRole('ENTREGADOR')">
	      <li class="nav-item">
	        <a class="nav-link" href="/pedido/li qst">Listar pedidos</a>
	      </li>
      </sec:authorize>
      <sec:authorize access="hasRole('ADMIN')">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Admin
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/produto">Lista de produtos</a>
	          <a class="dropdown-item" href="/produto/form">Adicionar novo produto</a>
	        </div>
	      </li>
		</sec:authorize>
    </ul>
  </div>
</nav>