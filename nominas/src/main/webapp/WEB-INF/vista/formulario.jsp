<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
	.thead{
		color: #fff;
		background-color:#2e5d94;
	}
	.btn{
		color: #fff;
		background-color:#2e5d94;
		border: 0px solid;
	}
</style>
<title>Gestionar empleados</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark">
                <a href="paginaPrincipal"><img src="./back.png"></a>
                </nav>
                <div class="container">
                <h1 class="text-center">Gestión de nominas</h1>
                </div>
                <div class="container card col-md-5 justify-content-center">
                <f:form action="guardarEmpleado"
			modelAttribute="empleado" method="POST">
			
			<f:hidden path="id" />
			<f:hidden path="nomina.dniEmpleado"/>
			
			<div class="form-group">
				<label>Nombre:</label>
				<f:input path="nombre" class="form-control" required="required"></f:input>
			</div>
			<div class="form-group">
				<label>Dni:</label>
				<f:input path="dni" class="form-control" required="required"></f:input>
			</div>
			<div class="form-group">
				<label>Sexo:</label>
				<f:input path="sexo" class="form-control" required="required"></f:input>
			</div>
			<div class="form-group">
				<label>Categoria:</label>
				<f:input path="categoria" class="form-control" required="required"></f:input>
			</div>
			<div class="form-group">
				<label>Antiguedad:</label>
				<f:input path="antiguedad" class="form-control" required="required"></f:input>
			</div>

			<input class="btn btn-success" type="submit" value="Guardar empleado">

		</f:form>
                </div>

</body>
</html>