package DAO;

import Entity.Doctor;

import java.util.List;

public interface DoctorDaoInterface {
    boolean addDoctor(Doctor doctor);

    List<Doctor> getAllDoctor();

    Doctor getDoctorById(int id);

    Doctor getDoctorByUsername(String username);


    boolean updateDoctor(Doctor doctor);

    boolean deleteDoctorById(int id);

    boolean deleteDoctorByUsername(String username);

}
