package DAO;

import Entity.Patient;
import Entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PatientDAO implements PatientDaoInterface {

    private Connection connection;

    public PatientDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addPatient(Patient patient) {
        boolean f = false;
        String query = "insert into patient(name,email,phone_no, address, age,sex,username) value(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, patient.getName());
            pst.setString(2, patient.getEmail());
            pst.setString(3, patient.getPhone_no());
            pst.setString(4, patient.getAddress());
            pst.setInt(5, patient.getAge());
            pst.setString(6, patient.getSex());
            pst.setString(7, patient.getUser().getUsername());
            pst.executeUpdate();
            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Patient> getAllPatient() {
        List<Patient> patients = new ArrayList<>();
        String query = "select patient.*,user.password,user.role,user.active from patient inner join user on patient.username=user.username order by id DESC";

        try {
            Statement st = connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

                Patient patient = new Patient(id,name,email,phone_no,address,age,sex,user);
                patients.add(patient);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return patients;
    }

    @Override
    public Patient getPatientById(int Pid) {
        Patient patient = null;
        String query = "select patient.*,user.password,user.role,user.active from patient inner join user on patient.username=user.username where patient.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1,Pid);
            ResultSet rst = st.executeQuery();
            if (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);
               patient = new Patient(id,name,email,phone_no,address,age,sex,user);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return patient;
    }

    @Override
    public Patient getPatientByUsername(String uName) {
        Patient patient = null;
        String query = "select patient.*,user.password,user.role,user.active from patient inner join user on patient.username=user.username where patient.username=?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1,uName);
            ResultSet rst = st.executeQuery(query);
            if (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);
                patient = new Patient(id,name,email,phone_no,address,age,sex,user);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return patient;
    }

    @Override
    public List<Patient> searchPatientLimitByAny(String searchParam) {
        List<Patient> patients = new ArrayList<>();
        String query = "{call hms.searchPatientByAny(?)}";

        try {
            CallableStatement st = connection.prepareCall(query);
            st.setString(1,searchParam);
            st.execute();
            ResultSet rst = st.getResultSet();
            while (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                int age = rst.getInt("age");
                String sex = rst.getString("sex");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

                Patient patient = new Patient(id,name,email,phone_no,address,age,sex,user);
                patients.add(patient);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return patients;
    }

    @Override
    public int todayPatientCount() {
        int totalPatientToday = 0;
        String query = "SELECT COUNT(patient.id) AS totalPatientToday FROM patient inner join appointment a on patient.id = a.Patient_id where date = date(now())";
        try {
            Statement st = connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            if (rst.next()){
                totalPatientToday = rst.getInt("totalPatientToday");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return totalPatientToday;
    }

    @Override
    public boolean updatePatient(Patient patient) {
        boolean f= false;
        try {
            String query = "update patient set name =?, email =?, phone_no=?, address= ?, age=?,sex=? where id =?";

            PreparedStatement pst = this.connection.prepareStatement(query);
            pst.setString(1,patient.getName());
            pst.setString(2,patient.getEmail());
            pst.setString(3,patient.getPhone_no());
            pst.setString(4,patient.getAddress());
            pst.setInt(5,patient.getAge());
            pst.setString(6,patient.getSex());
            pst.setInt(7,patient.getId());
            pst.executeUpdate();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deletePatientById(int id) {
     boolean f = false;
        String query = "delete from patient where id=?";
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
    public boolean deletePatientByUsername(String username) {
       boolean f = false;
        String query = "delete from patient where id=?";
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
