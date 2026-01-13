package am.example.rentcar.servlet.customer;

import am.example.rentcar.model.Customer;
import am.example.rentcar.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/changeCustomer")
public class ChangeCustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("customer", customerService.getCustomerById(id));
        req.getRequestDispatcher("/customer/changeCustomer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = customerService.getCustomerById(id);
        customer.setName(req.getParameter("name"));
        customer.setSurname(req.getParameter("surname"));
        customer.setLicenseNumber(req.getParameter("licenseNumber"));
        customer.setPhone(req.getParameter("phone"));
        customer.setEmail(req.getParameter("email"));

        customerService.changeCustomer(customer);
        resp.sendRedirect("/customer");
    }
}
