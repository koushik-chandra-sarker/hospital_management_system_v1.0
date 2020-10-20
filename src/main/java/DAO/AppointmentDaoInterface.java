package DAO;

import Entity.Appointment;

import java.util.List;

public interface AppointmentDaoInterface {
    String addAppointment(Appointment appointment);

    List<Appointment> getAllAppointment();

    Appointment getAppointmentById(int id);

    Appointment getAppointmentByPatientId(int id);

    Appointment getAppointmentByUsername(String username);

    boolean updateAppointment(Appointment appointment);

    boolean deleteAppointmentById(int ssn);

}
