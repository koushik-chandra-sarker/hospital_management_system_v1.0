package DAO;

import Entity.Patient;
import Entity.Patient_limit;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PatientLimitDAO implements PatientLimitDaoInterface {

    private Connection connection;

    public PatientLimitDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addPatientLimit(Patient_limit patient_limit) {
        boolean f = false;
        String query = "insert into Patient_limit(date,doctor_avail_ssn,`limit`) value(?,?,?)";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, patient_limit.getDate());
            pst.setInt(2, patient_limit.getDoctor_avail_ssn());
            pst.setInt(3, patient_limit.getLimit());
            pst.executeUpdate();
            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Patient_limit> getAllPatientLimit() {
        List<Patient_limit> patient_limits = new ArrayList<>();
        try {
            String query = "select * from user";
            Statement st = this.connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()) {

                Patient_limit patient_limit = new Patient_limit(
                        rst.getString("date"),
                        rst.getInt("doctor_avail_ssn"),
                        rst.getInt("limit")

                );
                patient_limits.add(patient_limit);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient_limits;
    }

    @Override
    public Patient_limit getPatientLimitById(java.util.Date PDate) {
        Patient_limit patient_limit = null;
        try {

            String query1 = "select * from patient_limit where date=?";
            PreparedStatement pst1 = this.connection.prepareStatement(query1);
            pst1.setDate(1, (Date) PDate);
            ResultSet rst = pst1.executeQuery();
            if(rst.next()){
                patient_limit = new Patient_limit(
                        rst.getString("date"),
                        rst.getInt("doctor_avail_ssn"),
                        rst.getInt("limit")

                );
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return patient_limit;
    }

    @Override
    public Patient_limit getPatientLimitByDateAndDoctor_avail_Ssn(String date, int d_a_ssn) {
        Patient_limit patient_limit = null;
        try {

            String query1 = "select * from patient_limit where date=? and doctor_avail_ssn=?";
            PreparedStatement pst1 = this.connection.prepareStatement(query1);
            pst1.setString(1,  date);
            pst1.setInt(2, d_a_ssn);
            ResultSet rst = pst1.executeQuery();
            if(rst.next()){
                patient_limit = new Patient_limit(
                        rst.getInt("ssn"),
                        rst.getString("date"),
                        rst.getInt("doctor_avail_ssn"),
                        rst.getInt("limit")

                );
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return patient_limit;
    }


    @Override
    public boolean updatePatientLimit(Patient_limit patient_limit) {
        return false;
    }

    @Override
    public boolean deletePatientLimitById(java.util.Date date) {
        boolean f = false;
        String query = "delete from Patient_limit where date=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setDate(1, (Date) date);
            pst.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

}
