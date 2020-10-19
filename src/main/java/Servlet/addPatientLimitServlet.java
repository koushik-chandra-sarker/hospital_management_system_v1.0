package Servlet;

import DAO.DoctorAvailabilityDAO;
import DAO.PatientLimitDAO;
import Entity.Doctor_availability;
import Entity.Patient_limit;
import Helper.ConnectionProvider;
import Helper.DateAndDayCalculator;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addPatientLimitServlet")
public class addPatientLimitServlet extends HttpServlet {
    @SneakyThrows
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DoctorAvailabilityDAO doctorAvailabilityDAO = new DoctorAvailabilityDAO(ConnectionProvider.getConnection());
        PatientLimitDAO patientLimitDAO = new PatientLimitDAO(ConnectionProvider.getConnection());

        // Format-> YYYY-MM-DD
        String currentDate = request.getParameter("currentDate");
        List<String> sevenDateDay = new ArrayList<>();
        sevenDateDay = DateAndDayCalculator.getSevenDate(currentDate);

        for (String date: sevenDateDay){
            String day = DateAndDayCalculator.getDay(date);
            List<Doctor_availability> doctor_availability = doctorAvailabilityDAO.getAllDoctorAvailabilityByDay(day);
            for (Doctor_availability da: doctor_availability) {
                Patient_limit patient_limit1 = patientLimitDAO.getPatientLimitByDateAndDoctor_avail_Ssn(date, da.getSsn());
                Patient_limit patient_limit = new Patient_limit(date, da.getSsn(), da.getPatient_limit());
                if (patient_limit1 == null) {
                    patientLimitDAO.addPatientLimit(patient_limit);
                }
            }
        }

        /*String day = DateAndDayCalculator.getDay(currentDate);
        DoctorAvailabilityDAO doctorAvailabilityDAO = new DoctorAvailabilityDAO(ConnectionProvider.getConnection());
        PatientLimitDAO patientLimitDAO = new PatientLimitDAO(ConnectionProvider.getConnection());
        List<Doctor_availability> doctor_availability = doctorAvailabilityDAO.getAllDoctorAvailabilityByDay(day);

        for (Doctor_availability da: doctor_availability){
            Patient_limit patient_limit1 = patientLimitDAO.getPatientLimitByDateAndDoctor_avail_Ssn(currentDate,da.getSsn());
            Patient_limit patient_limit = new Patient_limit(currentDate,da.getSsn(),da.getPatient_limit());
            if (patient_limit1 == null){
                patientLimitDAO.addPatientLimit(patient_limit);
            }
        }*/
    }

}
