package am.example.rentcar.servlet.car;

import am.example.rentcar.model.Car;
import am.example.rentcar.service.CarService;
import am.example.rentcar.statusEnam.Status;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/changeCar")
public class ChangeCarServlet extends HttpServlet {

    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("car", carService.getCarById(id));
        req.getRequestDispatcher("/car/changeCar.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Car car = carService.getCarById(id);
        car.setBrand(req.getParameter("brand"));
        car.setModel(req.getParameter("model"));
        car.setYear(Integer.parseInt(req.getParameter("year")));
        car.setDailyRate(Double.parseDouble(req.getParameter("dailyRate")));
        car.setStatus(Status.valueOf(req.getParameter("status")));
        carService.changeCar(car);

        resp.sendRedirect("/car");

    }
}
