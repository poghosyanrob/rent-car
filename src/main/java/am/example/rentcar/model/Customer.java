package am.example.rentcar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    private int id;
    private String name;
    private String Surname;
    private String licenseNumber;
    private String phone;
    private String email;

    public Customer(String name, String surname, String licenseNumber, String phone, String email) {
        this.name = name;
        Surname = surname;
        this.licenseNumber = licenseNumber;
        this.phone = phone;
        this.email = email;
    }
}
