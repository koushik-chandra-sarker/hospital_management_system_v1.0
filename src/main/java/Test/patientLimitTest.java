package Test;

import DAO.PatientLimitDAO;
import Entity.Patient_limit;
import Helper.ConnectionProvider;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class patientLimitTest {
    public static void main(String[] args) throws ParseException {
        PatientLimitDAO patientLimitDAO = new PatientLimitDAO(ConnectionProvider.getConnection());
        Patient_limit patient_limit = new Patient_limit("2020-10-18",1,30);
        patientLimitDAO.addPatientLimit(patient_limit);

    }
}
