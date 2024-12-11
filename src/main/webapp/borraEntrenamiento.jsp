<%--
  Created by IntelliJ IDEA.
  User: Alan Kenneth
  Date: 11/12/2024
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Borrar Entrenamiento</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "secret");

        String sql = "DELETE FROM entrenamiento WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        int filasAfectadas = ps.executeUpdate();
        System.out.println("ENTRENAMIENTOS BORRADOS: " + filasAfectadas);
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

