package DAO;

import Entity.Patient;
import Entity.Patient_limit;

import java.util.Date;
import java.util.List;

public interface PatientLimitDaoInterface {
    boolean addPatientLimit(Patient_limit patient_limit);

    List<Patient_limit> getAllPatientLimit();


    Patient_limit getPatientLimitById(Date date);

    Patient_limit getPatientLimitByDateAndDoctor_avail_Ssn(String date, int d_a_ssn);

    boolean updatePatientLimit(Patient_limit patient_limit);

    boolean deletePatientLimitById(Date date);



}
