package am.example.rentcar.servlet.user;

import am.example.rentcar.model.User;
import am.example.rentcar.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.getUserByUsernameAndPassword(username, password);
        if (user != null) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/home");
        }else {
            req.getSession().setAttribute("message", "Invalid username or password");
            resp.sendRedirect("/login");
        }
    }
}
