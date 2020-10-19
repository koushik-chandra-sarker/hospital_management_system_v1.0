package Servlet;

import DAO.DoctorDAO;
import Helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());
        int id = Integer.parseInt(request.getParameter("docId"));
        boolean isDeleted = doctorDAO.deleteDoctorById(id);
        response.getWriter().print(isDeleted);
    }

}
