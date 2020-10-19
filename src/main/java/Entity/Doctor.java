package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Doctor {
    private int id;
    private String name;
    private String email;
    private String phone_no;
    private String speciality;
    private String qualification;
    private User user;

    public Doctor(String name, String email,String phone_no, String speciality, String qualification, User user) {
        this.name = name;
        this.email = email;
        this.phone_no = phone_no;
        this.speciality = speciality;
        this.qualification = qualification;
        this.user = user;
    }

    public Doctor(int id, String name, String email, String phone_no, String speciality, String qualification) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone_no = phone_no;
        this.speciality = speciality;
        this.qualification = qualification;
    }
}
