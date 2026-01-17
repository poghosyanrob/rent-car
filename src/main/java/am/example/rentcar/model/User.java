package am.example.rentcar.model;

import am.example.rentcar.model.statusEnam.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int  id;
    private String name;
    private String surname;
    private String username;
    private String password;
    private UserRole role;
}
