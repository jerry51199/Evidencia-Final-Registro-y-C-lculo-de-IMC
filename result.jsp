<%@ page import="com.example.bmi.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener usuario de la sesión
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Obtener posibles mensajes de error o resultado
    String error = (String) request.getAttribute("error");
    String bmi = (String) request.getAttribute("bmi");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado IMC</title>
</head>
<body>
<h2>Bienvenido, <%= user.getUsername() %>!</h2>

<!-- Formulario para ingresar peso y altura -->
<form action="calculateBMI" method="post">
    Peso (kg): <input type="text" name="weight" value="<%= user.getWeight() > 0 ? user.getWeight() : "" %>"><br>
    Altura (m): <input type="text" name="height" value="<%= user.getHeight() > 0 ? user.getHeight() : "" %>"><br>
    <input type="submit" value="Calcular IMC">
</form>

<!-- Mostrar mensaje de error si existe -->
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>

<!-- Mostrar resultado de IMC si existe -->
<% if (bmi != null) { %>
    <h3>Tu IMC es: <%= bmi %></h3>
    <%
        double bmiValue = Double.parseDouble(bmi);
        String category;
        if (bmiValue < 18.5) {
            category = "Bajo peso";
        } else if (bmiValue < 25) {
            category = "Normal";
        } else if (bmiValue < 30) {
            category = "Sobrepeso";
        } else {
            category = "Obesidad";
        }
    %>
    <p>Categoría: <%= category %></p>
<% } %>

<!-- Opción para cerrar sesión -->
<form action="logout.jsp" method="post">
    <input type="submit" value="Cerrar sesión">
</form>

</body>
</html>
