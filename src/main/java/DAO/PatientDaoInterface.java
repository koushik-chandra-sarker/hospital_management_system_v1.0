package DAO;

import Entity.Patient;
import Entity.Patient_limit;

import java.util.List;

public interface PatientDaoInterface {
    boolean addPatient(Patient patient);

    List<Patient> getAllPatient();

    Patient getPatientById(int id);


    Patient getPatientByUsername(String username);

    List<Patient> searchPatientLimitByAny(String searchParam);

    boolean updatePatient(Patient patient);

    boolean deletePatientById(int id);

    boolean deletePatientByUsername(String username);

}
