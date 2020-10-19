package Servlet;

import DAO.PatientDAO;
import DAO.StaffDAO;
import DAO.UserDAO;
import Entity.Patient;
import Entity.Staff;
import Entity.User;
import Helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addPatientServlet")
@MultipartConfig
public class addPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();

        String username = request.getParameter("patient_username");
        String name = request.getParameter("patient_name");
        String email = request.getParameter("patient_email");
        String phone = request.getParameter("patient_phone");
        String address = request.getParameter("patient_address");
        int age = Integer.parseInt(request.getParameter("patient_age"));
        String gender = request.getParameter("patient_gender");

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        PatientDAO patientDAO = new PatientDAO(ConnectionProvider.getConnection());

        User user = new User(username,username,email,"PATIENT",true);
        Patient patient = new Patient(name,email,phone,address,age,gender,user);

//        System.out.println(patient);
        boolean isUserSuccess =  userDAO.addUser(user);
        if (isUserSuccess){
            boolean isPatient_Success=patientDAO.addPatient(patient);
            if (!isPatient_Success){
                userDAO.deleteUserByUsername(username);
            }
            pr.write(String.valueOf(isPatient_Success));
        }
    }

}
