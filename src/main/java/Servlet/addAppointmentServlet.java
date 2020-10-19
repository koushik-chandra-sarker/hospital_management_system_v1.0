package Servlet;

import DAO.AppointmentDAO;
import DAO.PatientDAO;
import DAO.UserDAO;
import Entity.Appointment;
import Entity.Doctor;
import Entity.Patient;
import Entity.User;
import Helper.ConnectionProvider;

import javax.print.Doc;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addAppointmentServlet")
@MultipartConfig
public class addAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();

        int patient_id = Integer.parseInt(request.getParameter("appoint_patient_id"));
        String date = request.getParameter("appoint_patient_date");
        String time = request.getParameter("appoint_patient_time");
        int doctor_id = Integer.parseInt(request.getParameter("appoint_patient_docId"));
        Patient patient = new Patient();
        patient.setId(patient_id);
        Doctor doctor = new Doctor();
        doctor.setId(doctor_id);

        Appointment appointment = new Appointment(date,time,patient,doctor);
        AppointmentDAO appointmentDAO = new AppointmentDAO(ConnectionProvider.getConnection());
        String massage =  appointmentDAO.addAppointment(appointment);
        pr.print(massage);


    }

}
