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

@WebServlet(name = "updateDoctorServlet")
@MultipartConfig
public class updateDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();


        int id = Integer.parseInt(request.getParameter("doc_id"));
        String name = request.getParameter("doc_name");
        String email = request.getParameter("doc_email");
        String phone = request.getParameter("doc_phone");
        String speciality = request.getParameter("doc_speciality");
        String qualification = request.getParameter("doc_qualification");

        String username = request.getParameter("doc_username");
        String password = request.getParameter("doc_password");
        String role = request.getParameter("doc_role");
        boolean isActive = Boolean.parseBoolean(request.getParameter("doc_active"));

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());

        User user = new User(username,password,email,role,isActive);

        Doctor doctor = new Doctor(id,name,email,phone,speciality,qualification,user);


        boolean isUserSuccess =  userDAO.updateUser(user);
        if (isUserSuccess){
            boolean isDoc_Success=doctorDAO.updateDoctor(doctor);
            pr.write(String.valueOf(isDoc_Success));
        }
        else {
            pr.write("false");
        }
    }
}
