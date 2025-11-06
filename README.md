Calculadora de IMC con Registro e Inicio de Sesión
Descripción

Aplicación web desarrollada en Java con el patrón MVC que permite a los usuarios registrarse, iniciar sesión y calcular su Índice de Masa Corporal (IMC). La aplicación muestra la categoría del IMC y permite cerrar sesión para regresar a la pantalla principal.

Funcionalidades

Registro de usuarios: Permite crear un nuevo usuario con nombre de usuario y contraseña.

Inicio de sesión: Valida credenciales para acceder a la calculadora de IMC.

Cálculo de IMC: Recibe peso y altura, calcula el IMC y muestra la categoría correspondiente.

Cierre de sesión: Permite al usuario cerrar sesión y regresar a la pantalla principal.

Tecnologías

Lenguaje: Java 17

Framework: Servlet/JSP

Servidor: Apache Tomcat 10

Gestor de dependencias: Maven

Patrón: MVC (Modelo-Vista-Controlador)

Estructura del Proyecto
bmi-webapp/
│
├── src/main/java/com/example/bmi/controller/
│   ├── BmiServlet.java
│   ├── LoginServlet.java
│   ├── RegisterServlet.java
│   └── LogoutServlet.java
│
├── src/main/java/com/example/bmi/model/
│   ├── User.java
│   └── Database.java
│
├── src/main/webapp/
│   ├── index.jsp
│   ├── register.jsp
│   ├── login.jsp
│   └── bmi.jsp
│
└── pom.xml


Modelo: User.java, Database.java

Vista: index.jsp, register.jsp, login.jsp, bmi.jsp

Controlador: BmiServlet.java, LoginServlet.java, RegisterServlet.java, LogoutServlet.java

Clases Principales

User.java:

Contiene atributos del usuario (username, password, weight, height)

Método calculateBMI() para calcular el IMC.

Database.java:

Simula almacenamiento de usuarios en memoria.

Métodos: addUser(User user) y getUser(String username).

RegisterServlet.java:

Gestiona el registro de nuevos usuarios y los almacena en Database.

LoginServlet.java:

Valida las credenciales y establece sesión para el usuario.

BmiServlet.java:

Calcula el IMC del usuario y envía resultados a bmi.jsp.

LogoutServlet.java:

Invalida la sesión y redirige a index.jsp.

Uso

Desplegar la aplicación en Apache Tomcat 10.

Acceder a la aplicación desde un navegador web mediante http://localhost:8080/bmi-webapp/.

Elegir Registrar Usuario o Iniciar Sesión.

Completar los formularios de registro o login.

Una vez logueado, ingresar peso y altura para calcular el IMC.

Cerrar sesión con la opción disponible para regresar a la pantalla principal.

Notas

La base de datos está simulada en memoria (Database.java).

Para un proyecto real, se recomienda usar una base de datos persistente y cifrado de contraseñas.
