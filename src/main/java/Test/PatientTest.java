package Test;

import DAO.PatientDAO;
import DAO.StaffDAO;
import Entity.Patient;
import Helper.ConnectionProvider;

import java.util.List;

public class PatientTest {
    public static void main(String[] args) {
        PatientDAO dao = new PatientDAO(ConnectionProvider.getConnection());

        List<Patient> patients = dao.searchPatientLimitByAny("male");
        System.out.println(patients);


    }
}
