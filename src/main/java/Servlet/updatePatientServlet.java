package Servlet;

import DAO.PatientDAO;
import Entity.Patient;
import Helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updatePatientServlet")
@MultipartConfig
public class updatePatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();
        int id = Integer.parseInt(request.getParameter("patient_id"));
        String name = request.getParameter("patient_name");
        String email = request.getParameter("patient_email");
        String phone = request.getParameter("patient_phone");
        String address = request.getParameter("patient_address");
        int age = Integer.parseInt(request.getParameter("patient_age"));
        String gender = request.getParameter("patient_gender");

        PatientDAO patientDAO = new PatientDAO(ConnectionProvider.getConnection());
        Patient patient = new Patient(id,name,email,phone,address,age,gender);

        boolean isSuccess =  patientDAO.updatePatient(patient);
        pr.write(String.valueOf(isSuccess));
    }
}
