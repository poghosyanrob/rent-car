package am.example.rentcar.servlet.rental;

import am.example.rentcar.model.Rental;
import am.example.rentcar.model.User;
import am.example.rentcar.service.RentalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/rental")
public class RentalServlet extends HttpServlet {
    private RentalService rentalService = new RentalService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Rental> rentalList = rentalService.getAllRental();
        req.setAttribute("rental", rentalList);
        req.getRequestDispatcher("/WEB-INF/rental/rental.jsp").forward(req, resp);

    }
}
