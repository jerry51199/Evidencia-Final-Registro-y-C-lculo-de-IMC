import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.example.bmi.model.User;
import com.example.bmi.util.Database;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (Database.validateUser(username, password)) {
            User user = Database.findUserByUsername(username);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("bmi.jsp"); // Página para ingresar peso/altura y calcular IMC
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
