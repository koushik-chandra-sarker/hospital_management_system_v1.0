package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Staff {
    private int id;
    private String name;
    private String email;
    private String phone_no;
    private String address;
    private String department;
    private String sex;
    private int salary;
    private User user;

    public Staff(String name, String email, String phone_no, String address, String department, String sex, int salary, User user) {
        this.name = name;
        this.email = email;
        this.phone_no = phone_no;
        this.address = address;
        this.department = department;
        this.sex = sex;
        this.salary = salary;
        this.user = user;
    }

    /*public Staff(int id, String name, String email, String phone_no, String address, String department, String sex, int salary, User user) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone_no = phone_no;
        this.address = address;
        this.department = department;
        this.sex = sex;
        this.salary = salary;
        this.user = user;
    }*/
}
