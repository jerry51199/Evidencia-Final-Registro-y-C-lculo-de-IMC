<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login de Usuario</title>
</head>
<body>
<h2>Login</h2>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>

<form action="login" method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Ingresar">
</form>

<p>¿No tienes cuenta? <a href="register.jsp">Regístrate aquí</a></p>
<p><a href="index.jsp">Regresar a la pantalla principal</a></p>
</body>
</html>
