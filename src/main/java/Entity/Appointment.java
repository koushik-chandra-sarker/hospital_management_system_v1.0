package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Appointment {
    private int ssn;
    private String date;
    private String time;
    private Patient patient;
    private Doctor doctor;

    public Appointment(String date, String time, Patient patient, Doctor doctor) {
        this.date = date;
        this.time = time;
        this.patient = patient;
        this.doctor = doctor;
    }
}
