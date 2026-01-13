package am.example.rentcar.servlet.rental;

import am.example.rentcar.model.Car;
import am.example.rentcar.service.CarService;
import am.example.rentcar.service.RentalService;
import am.example.rentcar.statusEnam.Status;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/deleteRental")
public class DeleteRentalServlet extends HttpServlet {

    private RentalService rentalService = new RentalService();
    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Car car = rentalService.getRentalById(id).getCar();
        car.setStatus(Status.FREE);
        carService.changeCar(car);
        rentalService.deleteRental(id);
        resp.sendRedirect("/rental");
    }

}
