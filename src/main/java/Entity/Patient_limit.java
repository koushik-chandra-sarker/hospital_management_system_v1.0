package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Patient_limit {
    private int ssn;
    private String date;
    private int doctor_avail_ssn;
    private int limit;

    public Patient_limit(String date, int doctor_avail_ssn, int limit) {
        this.date = date;
        this.doctor_avail_ssn = doctor_avail_ssn;
        this.limit = limit;
    }
}
