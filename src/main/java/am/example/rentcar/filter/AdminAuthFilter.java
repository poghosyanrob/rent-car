package am.example.rentcar.filter;

import am.example.rentcar.model.User;
import am.example.rentcar.model.statusEnam.UserRole;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/changeCar",
        "/deleteCar",
        "/deleteCustomer",
        "/deleteRental",
        "/changeCustomer",
        "/changeRental"

})
public class AdminAuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if(servletRequest instanceof HttpServletRequest request){
            User user = (User) request.getSession().getAttribute("user");
            if (user != null && user.getRole() == UserRole.ADMIN){
                filterChain.doFilter(servletRequest,servletResponse);
            }else{
                ((HttpServletResponse) servletResponse).sendRedirect("/home");
            }
        }
    }
}
