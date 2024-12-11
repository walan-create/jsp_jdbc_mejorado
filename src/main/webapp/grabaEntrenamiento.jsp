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
    <title>Grabar Entrenamiento</title>
</head>
<body>
<%
    String tipo = request.getParameter("tipo");
    String ubicacion = request.getParameter("ubicacion");
    String fecha = request.getParameter("fecha");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "secret");

        String sql = "INSERT INTO entrenamiento (tipo, ubicacion, fecha) VALUES (?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, tipo);
        ps.setString(2, ubicacion);
        ps.setDate(3, Date.valueOf(fecha));

        int filasAfectadas = ps.executeUpdate();
        System.out.println("ENTRENAMIENTOS GRABADOS: " + filasAfectadas);
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try { ps.close(); } catch (Exception e) { /* Ignored */ }
        try { conn.close(); } catch (Exception e) { /* Ignored */ }
    }

    response.sendRedirect("listadoEntrenamientos.jsp");
%>
</body>
</html>


