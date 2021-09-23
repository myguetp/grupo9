<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios</title>
<link rel="stylesheet" type="text/css" href="">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<h1>Usuarios</h1>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendagenerica", "root", "root");
	PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios");
	ResultSet result = ps.executeQuery();
	%>
	<div id="tabla">
		<table border = "1">
			<tr>
				<th>Cedula</th>
				<th>Correo</th>
				<th>Nombre</th>
				<th>Contraseña</th>
				<th>Usuario</th>
				<th colspan = "2">Acciones</th>
			</tr>
			<%
				while(result.next()){
			%>
			<tr>
				<td><%=result.getInt("cedula_usuario") %>
				<td><%=result.getString("email_usuario") %>
				<td><%=result.getString("nombre_usuario") %>
				<td><%=result.getString("password") %>
				<td><%=result.getString("usuario") %>
				<td><a href = "editarUsuario.jsp?cedula=<%= result.getInt("cedula_usuario")%>">Editar</a></td>
				<td><a href = "eliminarUsuario.jsp?cedula=<%= result.getInt("cedula_usuario")%>">Eliminar</a></td>
			
			</tr>
			<%} %>
		</table>
	</div>
	<a href = "agregarUsuario.html">Agregar Usuario</a>
	<a href = "consultarUsuario.jsp">Consultar Usuario</a>
	
</body>
</html>
