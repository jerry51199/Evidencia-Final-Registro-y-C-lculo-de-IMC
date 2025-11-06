import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.example.bmi.model.User;
import com.example.bmi.util.Database;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String weightStr = request.getParameter("weight");
        String heightStr = request.getParameter("height");

        // Validación simple
        if (username.isEmpty() || password.isEmpty() || weightStr.isEmpty() || heightStr.isEmpty()) {
            request.setAttribute("message", "Todos los campos son obligatorios");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            double weight = Double.parseDouble(weightStr);
            double height = Double.parseDouble(heightStr);

            User user = new User(username, password, weight, height);
            Database.addUser(user);

            request.setAttribute("message", "Usuario registrado exitosamente!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("message", "Peso o altura no válidos");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
