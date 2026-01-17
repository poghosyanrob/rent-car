package am.example.rentcar.servlet.rental;

import am.example.rentcar.model.Car;
import am.example.rentcar.model.Rental;
import am.example.rentcar.service.CarService;
import am.example.rentcar.service.CustomerService;
import am.example.rentcar.service.RentalService;
import am.example.rentcar.model.statusEnam.Status;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/addRental")
public class AddRentalServlet extends HttpServlet {
    private RentalService rentalService = new RentalService();
    private CarService carService = new CarService();
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customer", customerService.getAllCustomer());
        req.setAttribute("car", carService.getAllCar());
        req.getRequestDispatcher("/WEB-INF/rental/addRental.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int carId = Integer.parseInt(req.getParameter("car_id"));
        int customerId = Integer.parseInt(req.getParameter("customer_id"));
        String startDate = req.getParameter("start_date");
        String endDate = req.getParameter("end_date");
        Car car = carService.getCarById(carId);
        car.setStatus(Status.RENTAL);
        carService.changeCar(car);
        Rental rental = new Rental(car, customerService.getCustomerById(customerId), startDate, endDate);
        rentalService.addRental(rental);
        resp.sendRedirect("/rental");
    }
}
