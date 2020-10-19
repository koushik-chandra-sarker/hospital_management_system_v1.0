package DAO;

import Entity.Doctor;
import Entity.Doctor_availability;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorAvailabilityDAO implements DoctorAvailabilityInterface {

    private Connection connection;

    public DoctorAvailabilityDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addDoctorAvailability(Doctor_availability doctor_availability) {
        boolean f = false;
        String query = "insert into doctor_availability(day, start_time, end_time, Shift, patient_limit, room, doctor_id) value(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, doctor_availability.getDay());
            pst.setString(2, doctor_availability.getStart_time());
            pst.setString(3, doctor_availability.getEnd_time());
            pst.setString(4, doctor_availability.getShift());
            pst.setInt(5, doctor_availability.getPatient_limit());
            pst.setString(6, doctor_availability.getRoom());
            pst.setInt(7, doctor_availability.getDoctor().getId());
            pst.executeUpdate();
            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Doctor_availability> getAllDoctorAvailability() {
        return null;
    }

    @Override
    public List<Doctor_availability> getAllDoctorAvailabilityByDoctorId() {
        return null;
    }

    @Override
    public List<Doctor_availability> getAllDoctorAvailabilityByDay(String day1) {
        List<Doctor_availability> doctor_availabilities = new ArrayList<>();
        String query = "select * from doctor_availability where day = ?";

        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1,day1);
            ResultSet rst = pst.executeQuery();
            while (rst.next()){
                int ssn = rst.getInt("ssn");
                String day = rst.getString("day");
                String statTime = rst.getString("start_time");
                String endTime = rst.getString("end_time");
                String shift = rst.getString("shift");
                int patientLimit = rst.getInt("patient_limit");
                String room = rst.getString("room");
                Doctor doctor = new Doctor();
                doctor.setId(rst.getInt("doctor_id"));
                /*Doctor doctor = new Doctor(
                        rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),
                        rst.getString("phone_no"),
                        rst.getString("speciality"),
                        rst.getString("qualification")
                );*/
                Doctor_availability doctorAvailability = new Doctor_availability(ssn,day,statTime,endTime,shift,room,patientLimit,doctor);
                doctor_availabilities.add(doctorAvailability);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return doctor_availabilities;
    }

    @Override
    public Doctor_availability getDoctorAvailabilityById(int ssn) {
        return null;
    }

    @Override
    public boolean updateDoctorAvailability(Doctor_availability doctor_availability) {
        return false;
    }

    @Override
    public boolean deleteDoctorAvailabilityById(int ssn) {
        return false;
    }

    @Override
    public boolean deleteDoctorAvailabilityByDoctorId(int id) {
        return false;
    }
}
