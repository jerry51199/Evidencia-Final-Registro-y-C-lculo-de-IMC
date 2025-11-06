<%@ page import="com.example.bmi.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String error = (String) request.getAttribute("error");
    String bmi = (String) request.getAttribute("bmi");
%>
<h2>Hola, <%= user.getUsername() %>!</h2>

<form action="calculateBMI" method="post">
    Peso (kg): <input type="text" name="weight" value="<%= user.getWeight() %>"><br>
    Altura (m): <input type="text" name="height" value="<%= user.getHeight() %>"><br>
    <input type="submit" value="Calcular IMC">
</form>

<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>

<% if (bmi != null) { 
       double bmiValue = Double.parseDouble(bmi);
       String category = bmiValue < 18.5 ? "Bajo peso" :
                         bmiValue < 25 ? "Normal" :
                         bmiValue < 30 ? "Sobrepeso" : "Obesidad";
%>
    <p>Tu IMC es: <%= bmi %></p>
    <p>Categoría: <%= category %></p>
<% } %>
<p><a href="index.jsp" onclick="<% session.invalidate(); %>">Cerrar sesión y regresar a pantalla principal</a></p>
