package DAO;

import Entity.AvailableDoctor_all_info;
import Entity.Doctor;
import Entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO implements DoctorDaoInterface {

    private Connection connection;

    public DoctorDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addDoctor(Doctor doctor) {
        boolean f = false;
        String query = "insert into doctor(name,email,phone_no, speciality, qualification,username) value(?,?,?,?,?,?)";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, doctor.getName());
            pst.setString(2, doctor.getEmail());
            pst.setString(3, doctor.getPhone_no());
            pst.setString(4, doctor.getSpeciality());
            pst.setString(5, doctor.getQualification());
            pst.setString(6, doctor.getUser().getUsername());
            pst.executeUpdate();
            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

   /* @Override
    public List<Doctor> getAllDoctor() {
        List<Doctor> doctors = new ArrayList<>();
        String query = "select doctor.*,user.password,user.role,user.active from doctor inner join user on doctor.username=user.username";

        try {
            Statement st = connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String qualification = rst.getString("qualification");
                String speciality = rst.getString("speciality");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

                Doctor doctor = new Doctor(id,name,email,phone_no,speciality,qualification,user);
                doctors.add(doctor);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return doctors;
    }*/
    @Override
    public List<Doctor> getAllDoctor() {
        List<Doctor> doctors = new ArrayList<>();
        String query = "call hms.getAllDoctor();";

        try {
            Statement st = connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String qualification = rst.getString("qualification");
                String speciality = rst.getString("speciality");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

                Doctor doctor = new Doctor(id,name,email,phone_no,speciality,qualification,user);
                doctors.add(doctor);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return doctors;
    }

    @Override
    public List<AvailableDoctor_all_info> getAllAvailableDoctorFullInfo(String date) {
        List<AvailableDoctor_all_info>  availableDoctor_all_infos = new ArrayList<>();
        String query = "{call getAvailableDoctor_all_info(?)}";

        try {
            CallableStatement st = connection.prepareCall(query);
            st.setString(1,date);
            st.execute();
            ResultSet rst = st.getResultSet();
            while (rst.next()){
                AvailableDoctor_all_info availableDoctor_all_info = new AvailableDoctor_all_info(
                        rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),
                        rst.getString("phone_no"),
                        rst.getString("speciality"),
                        rst.getString("qualification"),
                        rst.getString("room"),
                        rst.getInt("limit"),
                        rst.getString("date"),
                        rst.getString("start_time"),
                        rst.getString("end_time"),
                        rst.getString("shift")

                );
                availableDoctor_all_infos.add(availableDoctor_all_info);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }


        return availableDoctor_all_infos;
    }

    @Override
    public Doctor getDoctorById(int Did) {

        Doctor doctor = null;
        String query = "select doctor.*,user.password,user.role,user.active from doctor inner join user on doctor.username=user.username where doctor.id=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1,Did);
            ResultSet rst = pst.executeQuery();
            if (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String qualification = rst.getString("qualification");
                String speciality = rst.getString("speciality");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

               doctor = new Doctor(id,name,email,phone_no,speciality,qualification,user);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return doctor;
    }

    @Override
    public Doctor getDoctorByUsername(String UName) {
        Doctor doctor = null;
        String query = "select doctor.*,user.password,user.role,user.active from doctor inner join user on doctor.username=user.username where doctor.username=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1,UName);
            ResultSet rst = pst.executeQuery();
            if (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String qualification = rst.getString("qualification");
                String speciality = rst.getString("speciality");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

                doctor = new Doctor(id,name,email,phone_no,speciality,qualification,user);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return doctor;
    }

    @Override
    public boolean updateDoctor(Doctor doctor) {
        boolean f= false;
        try {
            String query = "update doctor set name =?, email =?, phone_no=?, qualification= ?, speciality=? where id =?";

            PreparedStatement pst = this.connection.prepareStatement(query);
            pst.setString(1,doctor.getName());
            pst.setString(2,doctor.getEmail());
            pst.setString(3,doctor.getPhone_no());
            pst.setString(4,doctor.getQualification());
            pst.setString(5,doctor.getSpeciality());
            pst.setInt(6,doctor.getId());
            pst.executeUpdate();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteDoctorById(int id) {
        boolean f = false;
        String query = "delete from doctor where id=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteDoctorByUsername(String username) {
        boolean f = false;
        String query = "delete from doctor where username=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, username);
            pst.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }
}
