🏋️ Calculadora de IMC Web con Registro e Login
🚀 Descripción

Bienvenido a la Calculadora de IMC Web, una aplicación interactiva que permite a los usuarios:

Registrarse y crear su cuenta.

Iniciar sesión de manera segura.

Calcular su Índice de Masa Corporal (IMC) y conocer su categoría: Bajo peso, Normal, Sobrepeso u Obesidad.

Cerrar sesión y volver a la pantalla principal.

Todo esto con una interfaz sencilla y fluida, basada en Java, JSP y Servlets usando el patrón MVC.

🎯 Funcionalidades

📝 Registro de Usuario: Crea una cuenta con nombre de usuario y contraseña.

🔑 Inicio de Sesión: Accede a tu perfil y calcula tu IMC.

⚖️ Cálculo de IMC: Ingresa peso y altura para conocer tu estado de salud.

🔄 Cerrar Sesión: Vuelve a la pantalla principal de forma segura.

🛠 Tecnologías

Lenguaje: Java 17

Framework: Servlets / JSP

Servidor: Apache Tomcat 10

Gestor de Dependencias: Maven

Patrón de Diseño: MVC (Modelo-Vista-Controlador)

📂 Estructura del Proyecto
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


🧩 Clases Principales

User.java

Contiene atributos: username, password, weight, height

Método calculateBMI() para calcular IMC.

Database.java

Simula almacenamiento de usuarios en memoria.

Métodos: addUser(User user), getUser(String username)

RegisterServlet.java

Recibe los datos de registro y los almacena en la base de datos.

LoginServlet.java

Valida credenciales y establece sesión del usuario.

BmiServlet.java

Calcula el IMC y envía resultados a la vista bmi.jsp.

LogoutServlet.java

Cierra sesión y redirige a la pantalla principal (index.jsp).

💻 Cómo Usar la Aplicación

Despliega la aplicación en Apache Tomcat 10.

Accede desde tu navegador a: http://localhost:8080/bmi-webapp/

Elige Registrar Usuario o Iniciar Sesión.

Completa los formularios según corresponda.

Calcula tu IMC ingresando peso y altura.

Cierra sesión con la opción disponible para volver al inicio.

🔒 Notas Importantes

La base de datos está simulada en memoria (Database.java).

Para un entorno real:

Usar una base de datos persistente.

Aplicar hashing de contraseñas para mayor seguridad.

Esta versión es ideal para demostraciones y prácticas académicas.

🎉 Contribuciones

Si deseas mejorar esta aplicación:

Agregar almacenamiento real en base de datos.

Mejorar la interfaz con CSS y Bootstrap.

Implementar medidas de seguridad adicionales.
