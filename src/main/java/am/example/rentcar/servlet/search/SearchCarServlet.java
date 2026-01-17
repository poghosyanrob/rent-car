package am.example.rentcar.servlet.search;

import am.example.rentcar.model.Car;
import am.example.rentcar.service.CarService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/searchCar")
public class SearchCarServlet extends HttpServlet {

    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> carList = carService.getAllCar();
        req.setAttribute("car", carList);
        req.getRequestDispatcher("/WEB-INF/search/searchCar.jsp").forward(req, resp);
    }
}
