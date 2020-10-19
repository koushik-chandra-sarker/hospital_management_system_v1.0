package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Patient {
    private int id;
    private String name;
    private String email;
    private String phone_no;
    private String address;
    private int age;
    private String sex;
    private User user;

    public Patient(String name, String email, String phone_no, String address, int age, String sex, User user) {
        this.name = name;
        this.email = email;
        this.phone_no = phone_no;
        this.address = address;
        this.age = age;
        this.sex = sex;
        this.user = user;
    }

    public Patient(int id, String name, String email, String phone_no, String address, int age, String sex) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone_no = phone_no;
        this.address = address;
        this.age = age;
        this.sex = sex;
    }
}
