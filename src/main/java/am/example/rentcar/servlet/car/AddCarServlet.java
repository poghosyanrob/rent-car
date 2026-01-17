package am.example.rentcar.servlet.car;

import am.example.rentcar.model.Car;
import am.example.rentcar.service.CarService;
import am.example.rentcar.model.statusEnam.Status;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/addCar")
public class AddCarServlet extends HttpServlet {
    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/car/addCar.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        double dailyRate = Double.parseDouble(req.getParameter("dailyRate"));
        Status status = Status.valueOf(req.getParameter("status"));
        carService.addCar(new Car(brand, model, year, dailyRate, status));

        resp.sendRedirect("/car");
    }
}
