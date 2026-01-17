package am.example.rentcar.servlet.user;

import am.example.rentcar.model.User;
import am.example.rentcar.model.statusEnam.UserRole;
import am.example.rentcar.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = ("/register"))
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/user/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");

        if(userService.getUserByUsername(username) != null){
            req.getSession().setAttribute("message","Username already exists");
            resp.sendRedirect("/register");
        }else {
            User user = new User();
            user.setName(req.getParameter("name"));
            user.setSurname(req.getParameter("surname"));
            user.setUsername(username);
            user.setPassword(req.getParameter("password"));
            user.setRole(UserRole.valueOf(req.getParameter("role")));
            userService.addUser(user);
            req.getSession().setAttribute("user",user);
            resp.sendRedirect("/home");
        }

    }
}
