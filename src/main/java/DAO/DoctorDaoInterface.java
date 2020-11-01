package DAO;

import Entity.AvailableDoctor_all_info;
import Entity.Doctor;

import java.sql.SQLException;
import java.util.List;

public interface DoctorDaoInterface {
    boolean addDoctor(Doctor doctor);

    List<Doctor> getAllDoctor();

    List<AvailableDoctor_all_info> getAllAvailableDoctorFullInfo(String date) throws SQLException;

    Doctor getDoctorById(int id);

    int doctorCount();

    Doctor getDoctorByUsername(String username);


    boolean updateDoctor(Doctor doctor);

    boolean deleteDoctorById(int id);

    boolean deleteDoctorByUsername(String username);

}
