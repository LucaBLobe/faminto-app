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
	<table class="table table-dark">
		<thead>


			<tr>
				<th scope="col">ID</th>
				<th scope="col">Nome</th>
				<th scope="col">Descrição</th>
				<th scope="col">Preço</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ produtos }" var="produto">
				<tr>
					<th scope="row">${ produto.id }</th>
					<td>${produto.nome }</td>
					<td>${produto.descricao} </td>
					<td>R$ ${produto.preco} </td>
				</tr>
			</c:forEach>
	
		</tbody>
	</table>

	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</html>