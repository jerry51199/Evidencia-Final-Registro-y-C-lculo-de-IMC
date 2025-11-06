import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.example.bmi.model.User;
import com.example.bmi.util.Database;



@WebServlet("/calculateBMI")
public class BmiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String weightParam = request.getParameter("weight");
        String heightParam = request.getParameter("height");

        String error = null;
        String bmiStr = null;

        try {
            double weight = Double.parseDouble(weightParam);
            double height = Double.parseDouble(heightParam);

            if (weight <= 0 || height <= 0) {
                error = "Peso y altura deben ser mayores a cero";
            } else {
                user.setWeight(weight);
                user.setHeight(height);
                bmiStr = String.format("%.2f", user.calculateBMI());
            }
        } catch (NumberFormatException e) {
            error = "Peso o altura no válidos";
        }

        request.setAttribute("error", error);
        request.setAttribute("bmi", bmiStr);
        request.getRequestDispatcher("bmi.jsp").forward(request, response);
    }
}
