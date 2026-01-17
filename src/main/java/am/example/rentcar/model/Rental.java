package am.example.rentcar.model;

import am.example.rentcar.model.statusEnam.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rental {
    private int id;
    private Car car;
    private Customer customer;
    private String startDate;
    private String endDate;
    private double totalCost;
    private Status status;

    public Rental(Car car, Customer customer, String startDate, String endDate) {
        this.car = car;
        this.customer = customer;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalCost = ChronoUnit.DAYS.between(LocalDate.parse(startDate), LocalDate.parse(endDate)) * car.getDailyRate();
        this.status = car.getStatus();
    }
}
