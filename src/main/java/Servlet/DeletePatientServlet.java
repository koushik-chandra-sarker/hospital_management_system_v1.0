package Servlet;

import DAO.DoctorDAO;
import DAO.PatientDAO;
import DAO.StaffDAO;
import DAO.UserDAO;
import Helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        PatientDAO patientDAO = new PatientDAO(ConnectionProvider.getConnection());
        int id = Integer.parseInt(request.getParameter("patientId"));
        String username = request.getParameter("username");
        boolean isDeleted = patientDAO.deletePatientById(id);
        userDAO.deleteUserByUsername(username);
        response.getWriter().print(isDeleted);


    }

}
