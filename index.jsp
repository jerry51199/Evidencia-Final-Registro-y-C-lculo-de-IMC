<%@ page import="com.example.bmi.model.User" %>
<%@ page import="com.example.bmi.util.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = "";
    String error = "";

    // Manejar envío del formulario
    String usernameParam = request.getParameter("username");
    String passwordParam = request.getParameter("password");
    String weightParam = request.getParameter("weight");
    String heightParam = request.getParameter("height");

    User user = null;
    String bmiStr = null;

    if (usernameParam != null && passwordParam != null) {
        // Validar campos vacíos
        if (usernameParam.trim().isEmpty() || passwordParam.trim().isEmpty() ||
            weightParam == null || weightParam.trim().isEmpty() ||
            heightParam == null || heightParam.trim().isEmpty()) {

            error = "Todos los campos son obligatorios";

        } else {
            try {
                double weight = Double.parseDouble(weightParam.trim());
                double height = Double.parseDouble(heightParam.trim());

                if (weight <= 0 || height <= 0) {
                    error = "Peso y altura deben ser mayores a cero";
                } else {
                    // Crear usuario y guardarlo en la "base de datos"
                    user = new User(usernameParam, passwordParam, weight, height);
                    Database.addUser(user);
                    bmiStr = String.format("%.2f", user.calculateBMI());
                    message = "Usuario registrado y IMC calculado exitosamente!";
                }

            } catch (NumberFormatException e) {
                error = "Peso o altura no son válidos";
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro y Cálculo de IMC</title>
</head>
<body>
<h2>Registro y Cálculo de IMC</h2>

<!-- Mostrar mensajes -->
<% if (!error.isEmpty()) { %>
    <p style="color:red;"><%= error %></p>
<% } %>
<% if (!message.isEmpty()) { %>
    <p style="color:green;"><%= message %></p>
<% } %>

<!-- Formulario -->
<form method="post" action="index.jsp">
    Username: <input type="text" name="username" value="<%= usernameParam != null ? usernameParam : "" %>"><br>
    Password: <input type="password" name="password"><br>
    Peso (kg): <input type="text" name="weight" value="<%= weightParam != null ? weightParam : "" %>"><br>
    Altura (m): <input type="text" name="height" value="<%= heightParam != null ? heightParam : "" %>"><br>
    <input type="submit" value="Registrar y Calcular IMC">
</form>

<% if (bmiStr != null && user != null) { %>
    <h3>Bienvenido, <%= user.getUsername() %>!</h3>
    <p>Peso: <%= user.getWeight() %> kg</p>
    <p>Altura: <%= user.getHeight() %> m</p>
    <p>Tu IMC es: <%= bmiStr %></p>
    <%
        double bmiValue = Double.parseDouble(bmiStr);
        String category;
        if (bmiValue < 18.5) category = "Bajo peso";
        else if (bmiValue < 25) category = "Normal";
        else if (bmiValue < 30) category = "Sobrepeso";
        else category = "Obesidad";
    %>
    <p>Categoría: <%= category %></p>
<% } %>

</body>
</html>
