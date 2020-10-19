package Servlet;


import DAO.DoctorAvailabilityDAO;
import Entity.Doctor;
import Entity.Doctor_availability;
import Helper.ConnectionProvider;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;

@WebServlet("/addDoctorAvailabilityServlet")
@MultipartConfig
public class addDoctorAvailabilityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();
        int docId = Integer.parseInt(request.getParameter("doc_id"));
        String day = request.getParameter("doc_avail_day");
        String startTime = request.getParameter("doc_avail_startTime");
        String endTime = request.getParameter("doc_avail_endTime");
        String shift= request.getParameter("doc_avail_shift");
        int patient_limit = Integer.parseInt(request.getParameter("doc_avail_patient_limit"));
        String room = request.getParameter("doc_avail_room");
        Doctor doctor = new Doctor();
        doctor.setId(docId);
        Doctor_availability doctor_availability = new Doctor_availability(day,startTime,endTime,shift,room,patient_limit,doctor);
        DoctorAvailabilityDAO doctorAvailabilityDAO = new DoctorAvailabilityDAO(ConnectionProvider.getConnection());
        boolean isSuccess = doctorAvailabilityDAO.addDoctorAvailability(doctor_availability);

        pr.print(isSuccess);

    }

}
