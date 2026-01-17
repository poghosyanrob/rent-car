package am.example.rentcar.servlet.customer;

import am.example.rentcar.model.Customer;
import am.example.rentcar.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/customer")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Customer> customerList = customerService.getAllCustomer();
        req.setAttribute("customer", customerList);
        req.getRequestDispatcher("/WEB-INF/customer/customer.jsp").forward(req, resp);

    }
}
