<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<form action="./form" method="POST">
		<div class="col-sm-6">

			<div class="form-group">
				<label for="exampleFormControlInput1">Nome</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					name="nome">
			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">Descrição</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" name="descricao"></textarea>
			</div>

			<div class="form-group">
				<label class="sr-only" for="inlineFormInputGroup">Preço</label>
				<div class="input-group mb-2">
					<div class="input-group-prepend">
						<div class="input-group-text">R$</div>
					</div>
					<input type="number" class="form-control" id="inlineFormInputGroup"
						name="preco">
				</div>
			</div>

			<button type="submit" class="btn btn-primary">Enviar</button>
		</div>
	</form>

	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>