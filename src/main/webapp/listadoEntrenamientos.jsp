<%--
  Created by IntelliJ IDEA.
  User: Alan Kenneth
  Date: 11/12/2024
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Entrenamientos</title>
</head>
<body>
<h1>Listado de Entrenamientos</h1>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "secret");
    Statement s = conexion.createStatement();
    ResultSet listado = s.executeQuery("SELECT * FROM entrenamiento");

    while (listado.next()) {
%>
<div>
    ID: <%= listado.getInt("id") %><br>
    Tipo: <%= listado.getString("tipo") %><br>
    Ubicación: <%= listado.getString("ubicacion") %><br>
    Fecha: <%= listado.getDate("fecha") %><br>
    <form method="post" action="borraEntrenamiento.jsp">
        <input type="hidden" name="id" value="<%= listado.getInt("id") %>"/>
        <input type="submit" value="Borrar">
    </form>
    <br>
</div>
<%
    }
    listado.close();
    s.close();
    conexion.close();
%>
</body>
</html>

