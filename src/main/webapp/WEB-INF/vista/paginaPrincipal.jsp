<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestión de empleados</title>
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
	#acc{
		width: 25%;
	}
</style>
</head>
<body>
	<div>
		<div class="container">
                      <h1 class="text-center">Gestión de nominas</h1>   
                    </div>
                    <div class="container">
                    <table class="table text-center table-bordered">
                        <thead class="thead">
                            <tr>
                                <th>Nombre</th>
                                <th>DNI</th>
                                <th>Sexo</th>
                                <th>Categoría</th>
                                <th>Años</th>
                                <th colspan="2">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
				<c:forEach var="empleado" items="${empleados}">
				
						<c:url var="actualizar" value="actualizar">
						<c:param name="idEmpleado" value="${empleado.id}"></c:param>
						</c:url>

					<c:url var="eliminar" value="eliminar">
					<c:param name="idEmpleado" value="${empleado.id}"></c:param>
					</c:url>

                                <tr>
                                    <td>
                                        <c:out value="${empleado.nombre}" />
                                    </td>  
                                    <td>
                                        <c:out value="${empleado.dni}" />
                                    </td>
                                    <td>
                                        <c:out value="${empleado.sexo}" />
                                    </td>
                                    <td>
                                        <c:out value="${empleado.antiguedad}" />
                                    </td>
                                     <td>
                                        <c:out value="${empleado.categoria}" />
                                    </td>
                                     <td colspan="2" id="acc">
                                    <a href=${actualizar } class="btn btn-warning">Actualizar</a>
                                    <a href=${eliminar } class="btn btn-danger" onclick="if (!(confirm('¿Seguro que quieres eliminar a ${empleado.nombre}?'))) return false">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                    </table>
                    <div class="container">
                    <a href="formulario" class="btn btn-primary">Añadir empleado</a>
                    </div>
                    <div class="container card col-md-5 justify-content-center">
                    	<form action="salario" method="POST">
                   		 <div class="container">
                   		 <br>
                   		 <h3>DNI</h3>
                    		<input pattern="\d{8}[A-HJ-NP-TV-Z]" type="text" placeholder="Introduce el dni" name="dniEmpleado" class="form-control" required="required" />
                   			<br>
                   			<input type="submit" class="btn btn-success" value="Mostrar salario" />
                   			<br>
                   			<br>
                   		 </div>
						</form>
						 <div>
					</div>
						<p>Nombre: ${nombre}</p>
						<p>Salario: ${sueldo}</p>
					</div>
					
                    </div>
                    
	</div>
</body>
</html>