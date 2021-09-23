<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<%
	String correo= request.getParameter("correo");
	String nombre= request.getParameter("nombre");
	String pass= request.getParameter("password");
	String usuario= request.getParameter("usuario");

     Class.forName("com.mysql.jdbc.Driver");
     Connection conexion =java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8", "root", "root");
     Statement st= conexion.createStatement();
     String sql= "INSERT INTO usuarios(email_usuario, nombre_usuario, password, usuario) VALUES('"+correo+"','"+nombre+"','"+pass+"','"+usuario+"')";
     st.executeUpdate(sql);
     response.sendRedirect("usuarios.jsp");
%>
</body>
</html>