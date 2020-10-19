package DAO;

import Entity.Appointment;
import Entity.Doctor;
import Entity.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO implements AppointmentDaoInterface {

    private Connection connection;

    public AppointmentDAO(Connection connection) {
        this.connection = connection;
    }


    @Override
    public boolean addAppointment(Appointment appointment) {
        boolean f = false;
        String query = "insert into appointment(Patient_id,data,time,doctor_id) value(?,?,?,?)";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1, appointment.getPatient().getId());
            pst.setDate(2, (Date) appointment.getDate());
            pst.setTime(3, appointment.getTime());
            pst.setInt(4, appointment.getDoctor().getId());
            pst.executeUpdate();
            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Appointment> getAllAppointment() {
        List<Appointment> appointments = new ArrayList<>();
        String query = "select appointment.*,patient.*, doctor.* from appointment inner join patient on appointment.Patient_id=patient.id inner join doctor on appointment.doctor_id=doctor.id";

        try {
            Statement st = connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                Appointment appointment = new Appointment();
                appointment.setSsn(rst.getInt("ssn"));
                appointment.setDate(rst.getDate("date"));
                appointment.setTime(rst.getTime("time"));
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                Patient patient = new Patient(id,name,email,phone_no,address,age,sex);
                Doctor doctor = new Doctor(
                        rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),
                        rst.getString("phone_no"),
                        rst.getString("speciality"),
                        rst.getString("qualification")
                );
                appointment.setPatient(patient);
                appointment.setDoctor(doctor);
                appointments.add(appointment);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return appointments;
    }

    @Override
    public Appointment getAppointmentById(int Aid) {
        Appointment appointment = new Appointment();
        String query = "select appointment.*,patient.*, doctor.* from appointment inner join patient on appointment.Patient_id=patient.id inner join doctor on appointment.doctor_id=doctor.id where ssn = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1,Aid);
            ResultSet rst = pst.executeQuery();
            if (rst.next()){
                appointment.setSsn(rst.getInt("ssn"));
                appointment.setDate(rst.getDate("date"));
                appointment.setTime(rst.getTime("time"));
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                Patient patient = new Patient(id,name,email,phone_no,address,age,sex);
                Doctor doctor = new Doctor(
                        rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),
                        rst.getString("phone_no"),
                        rst.getString("speciality"),
                        rst.getString("qualification")
                );
                appointment.setPatient(patient);
                appointment.setDoctor(doctor);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return appointment;
    }

    @Override
    public Appointment getAppointmentByUsername(String AUsername) {
        Appointment appointment = new Appointment();
        String query = "select appointment.*,patient.*, doctor.* from appointment inner join patient on appointment.Patient_id=patient.id inner join doctor on appointment.doctor_id=doctor.id where ssn = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1,AUsername);
            ResultSet rst = pst.executeQuery();
            if (rst.next()){
                appointment.setSsn(rst.getInt("ssn"));
                appointment.setDate(rst.getDate("date"));
                appointment.setTime(rst.getTime("time"));
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                Patient patient = new Patient(id,name,email,phone_no,address,age,sex);
                Doctor doctor = new Doctor(
                        rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),
                        rst.getString("phone_no"),
                        rst.getString("speciality"),
                        rst.getString("qualification")
                );
                appointment.setPatient(patient);
                appointment.setDoctor(doctor);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return appointment;
    }

    @Override
    public boolean updateAppointment(Appointment appointment) {
        boolean f= false;
        try {
            String query = "update appointment set date =?, time =?,doctor_id=? where ssn =?";

            PreparedStatement pst = this.connection.prepareStatement(query);
            pst.setDate(1, (Date) appointment.getDate());
            pst.setTime(2,appointment.getTime());
            pst.setInt(3,appointment.getDoctor().getId());
            pst.setInt(4,appointment.getSsn());
            pst.executeUpdate();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteAppointmentById(int ssn) {
        boolean f = false;
        String query = "delete from appointment where ssn=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1, ssn);
            pst.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

}
