package Test;

import DAO.AppointmentDAO;
import DAO.PatientDAO;
import DAO.StaffDAO;
import Entity.Appointment;
import Entity.Doctor;
import Entity.Patient;
import Helper.ConnectionProvider;

import java.util.List;

public class PatientTest {
    public static void main(String[] args) {
        PatientDAO dao = new PatientDAO(ConnectionProvider.getConnection());
        AppointmentDAO appointmentDAO = new AppointmentDAO(ConnectionProvider.getConnection());


       /* List<Patient> patients = dao.searchPatientLimitByAny("male");
        System.out.println(patients);*/
        Patient patient = new Patient();
        patient.setId(30300004);
        Doctor doctor = new Doctor();
        doctor.setId(10100001);
        Appointment ap = new Appointment("2020-10-20","2:30 PM",patient,doctor);
        String s = appointmentDAO.addAppointment(ap);
        System.out.println(s);

    }
}
