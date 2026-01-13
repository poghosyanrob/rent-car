package am.example.rentcar.servlet.rental;

import am.example.rentcar.model.Car;
import am.example.rentcar.model.Rental;
import am.example.rentcar.service.CarService;
import am.example.rentcar.service.CustomerService;
import am.example.rentcar.service.RentalService;
import am.example.rentcar.statusEnam.Status;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/changeRental")
public class ChangeRentalServlet extends HttpServlet {

    private RentalService rentalService = new RentalService();
    private CarService carService = new CarService();
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("rental", rentalService.getRentalById(id));
        req.setAttribute("customer", customerService.getAllCustomer());
        req.setAttribute("car", carService.getAllCar());
        req.getRequestDispatcher("/rental/changeRental.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Rental rental = rentalService.getRentalById(id);
        Car carPrevious = carService.getCarById(rental.getCar().getId());
        carPrevious.setStatus(Status.FREE);
        carService.changeCar(carPrevious);
        Car carNext = carService.getCarById(Integer.parseInt(req.getParameter("car_id")));
        carNext.setStatus(Status.RENTAL);
        rental.setCar(carNext);
        carService.changeCar(carNext);
        rental.setCustomer(customerService.getCustomerById(Integer.parseInt(req.getParameter("customer_id"))));
        rental.setStartDate(req.getParameter("start_date"));
        rental.setEndDate(req.getParameter("end_date"));

        rentalService.changeRental(rental);
        resp.sendRedirect("/rental");
    }
}

