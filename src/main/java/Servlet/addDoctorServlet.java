package Servlet;

import DAO.DoctorDAO;
import DAO.UserDAO;
import Entity.Doctor;
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

@WebServlet(name = "addDoctorServlet")
@MultipartConfig
public class addDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();

        String username = request.getParameter("doc_username");
        String name = request.getParameter("doc_name");
        String email = request.getParameter("doc_email");
        String phone = request.getParameter("doc_phone");
        String speciality = request.getParameter("doc_speciality");
        String qualification = request.getParameter("doc_qualification");

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());

        User user = new User(username,username,email,"DOCTOR",true);
        Doctor doctor = new Doctor(name,email,phone,speciality,username,user);
        boolean isSuccess =  userDAO.addUser(user);
        if (isSuccess){
            boolean isDoc_Success=doctorDAO.addDoctor(doctor);
            pr.write(String.valueOf(isDoc_Success));
            System.out.println("user add");
        }
        else {
            pr.write("false");
        }

    }
}
