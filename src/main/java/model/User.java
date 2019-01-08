package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class User implements Serializable {
    private Integer id;
    private String email;
    private String password;
    private UserInfo userInfo;

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
}
