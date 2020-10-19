package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AvailableDoctor_all_info {
    private int doctor_id;
    private String name;
    private String email;
    private String phone_no;
    private String speciality;
    private String qualification;
    private String room;
    private int limit;
    private String date;
    private String start_time;
    private String end_time;
    private String shift;

}
