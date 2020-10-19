package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Time;

@Data
@AllArgsConstructor
public class Doctor_availability {
    private int ssn;
    private String day;
    private String start_time;
    private String end_time;
    private String shift;
    private String room;
    private int patient_limit;
    private Doctor doctor;

    public Doctor_availability(String day, String start_time, String end_time, String shift, String room, int patient_limit, Doctor doctor) {
        this.day = day;
        this.start_time = start_time;
        this.end_time = end_time;
        this.shift = shift;
        this.room = room;
        this.patient_limit = patient_limit;
        this.doctor = doctor;
    }
}
