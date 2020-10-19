package DAO;

import Entity.Doctor_availability;

import java.util.List;

public interface DoctorAvailabilityInterface {
    boolean addDoctorAvailability(Doctor_availability doctor_availability);

    List<Doctor_availability> getAllDoctorAvailability();

    List<Doctor_availability> getAllDoctorAvailabilityByDoctorId();
    List<Doctor_availability> getAllDoctorAvailabilityByDay(String day);

    Doctor_availability getDoctorAvailabilityById(int ssn);

    boolean updateDoctorAvailability(Doctor_availability doctor_availability);

    boolean deleteDoctorAvailabilityById(int ssn);

    boolean deleteDoctorAvailabilityByDoctorId(int id);


}
