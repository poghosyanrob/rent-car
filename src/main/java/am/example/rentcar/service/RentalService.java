package am.example.rentcar.service;

import am.example.rentcar.db.BDConnectionProvider;
import am.example.rentcar.model.Rental;
import am.example.rentcar.statusEnam.Status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RentalService {
    private Connection connection = BDConnectionProvider.getInstace().getConnection();
    private CarService carService = new CarService();
    private CustomerService customerService = new CustomerService();

    public void addRental(Rental rental) {
        String sql = "INSERT INTO rental (car_id,customer_id,start_date,end_date,total_cost,status) VALUES (?, ?, ?, ?, ?,?)";

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            statement.setInt(1, rental.getCar().getId());
            statement.setInt(2, rental.getCustomer().getId());
            statement.setString(3, rental.getStartDate());
            statement.setString(4, rental.getEndDate());
            statement.setDouble(5, rental.getTotalCost());
            statement.setString(6, String.valueOf(rental.getStatus()));
            statement.execute();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                rental.setId(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRental(int id) {
        String sql = "DELETE FROM rental WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeRental(Rental rental) {
        String sql = "UPDATE rental SET car_id = ?,customer_id = ?,start_date = ?,end_date = ?,total_cost = ?, status = ?  WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, rental.getCar().getId());
            statement.setInt(2, rental.getCustomer().getId());
            statement.setString(3, rental.getStartDate());
            statement.setString(4, rental.getEndDate());
            statement.setDouble(5, rental.getTotalCost());
            statement.setString(6, String.valueOf(rental.getStatus()));
            statement.setInt(7, rental.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Rental> getAllRental() {
        String sql = "SELECT * FROM rental";
        List<Rental> rentalList = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                rentalList.add(getRental(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentalList;
    }

    public Rental getRentalById(int id) {
        String sql = "SELECT * FROM rental WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return getRental(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Rental getRental(ResultSet resultSet) throws SQLException {
        Rental rental = new Rental();
        rental.setId(resultSet.getInt("id"));
        rental.setCar(carService.getCarById(resultSet.getInt("car_id")));
        rental.setCustomer(customerService.getCustomerById(resultSet.getInt("customer_id")));
        rental.setStartDate(resultSet.getString("start_date"));
        rental.setEndDate(resultSet.getString("end_date"));
        rental.setTotalCost(resultSet.getDouble("total_cost"));
        rental.setStatus(Status.valueOf(resultSet.getString("status")));
        return rental;
    }

}
