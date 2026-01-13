package am.example.rentcar.model;

import am.example.rentcar.statusEnam.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Car {
    private int id;
    private String brand;
    private String model;
    private int year;
    private double dailyRate;
    private Status status;

    public Car(String brand, String model, int year, double dailyRate, Status status) {
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.dailyRate = dailyRate;
        this.status = status;
    }
}
