package am.example.rentcar.service;

import am.example.rentcar.db.BDConnectionProvider;
import am.example.rentcar.model.Car;
import am.example.rentcar.model.statusEnam.Status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CarService {

    private Connection connection = BDConnectionProvider.getInstace().getConnection();

    public void addCar(Car car) {
        String sql = "INSERT INTO car (brand,model,year,dailyRate,status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setString(3, String.valueOf(car.getYear()));
            statement.setString(4, String.valueOf(car.getDailyRate()));
            statement.setString(5, String.valueOf(car.getStatus()));
            statement.execute();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                car.setId(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCar(int id) {
        String sql = "DELETE FROM car WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeCar(Car car) {
        String sql = "UPDATE car SET brand = ?, model = ?, year= ?, dailyRate= ?, status= ?  WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setString(3, String.valueOf(car.getYear()));
            statement.setString(4, String.valueOf(car.getDailyRate()));
            statement.setString(5, String.valueOf(car.getStatus()));
            statement.setInt(6, car.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Car> getAllCar() {
        String sql = "SELECT * FROM car";
        List<Car> carList = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                carList.add(getCar(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carList;
    }


    public Car getCarById(int id){
        String sql = "SELECT * FROM car WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                return getCar(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    private static Car getCar(ResultSet resultSet) throws SQLException {
        Car car = new Car();
        car.setId(resultSet.getInt("id"));
        car.setBrand(resultSet.getString("brand"));
        car.setModel(resultSet.getString("model"));
        car.setYear(resultSet.getInt("year"));
        car.setDailyRate(resultSet.getDouble("dailyRate"));
        car.setStatus(Status.valueOf(resultSet.getString("status")));
        return car;
    }

}
