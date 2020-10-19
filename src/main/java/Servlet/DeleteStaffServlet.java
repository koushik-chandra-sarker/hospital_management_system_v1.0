package Servlet;

import DAO.DoctorDAO;
import DAO.StaffDAO;
import DAO.UserDAO;
import Helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteStaffServlet")
public class DeleteStaffServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        StaffDAO staffDAO = new StaffDAO(ConnectionProvider.getConnection());
        int id = Integer.parseInt(request.getParameter("staffId"));
        String username = request.getParameter("username");
        boolean isDeleted = staffDAO.deleteStaffById(id);
        userDAO.deleteUserByUsername(username);
        response.getWriter().print(isDeleted);
    }

}
