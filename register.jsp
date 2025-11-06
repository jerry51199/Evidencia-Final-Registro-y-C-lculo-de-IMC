<h2>Registro de Usuario</h2>

<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
    <p style="color:green;"><%= message %></p>
<% } %>

<form action="register" method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    Peso (kg): <input type="text" name="weight"><br>
    Altura (m): <input type="text" name="height"><br>
    <input type="submit" value="Registrar">
</form>

<p>¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
<p><a href="index.jsp">Regresar a la pantalla principal</a></p>

