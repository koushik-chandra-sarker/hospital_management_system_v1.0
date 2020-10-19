package Servlet;

import DAO.StaffDAO;
import DAO.UserDAO;
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

@WebServlet("/updateStaffServlet")
@MultipartConfig
public class updateStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();
        int id = Integer.parseInt(request.getParameter("staff_id"));
        String name = request.getParameter("staff_name");
        String email = request.getParameter("staff_email");
        String phone = request.getParameter("staff_phone");
        String address = request.getParameter("staff_address");
        String department = request.getParameter("staff_department");
        int salary = Integer.parseInt(request.getParameter("staff_salary"));
        String gender = request.getParameter("staff_gender");

        String username = request.getParameter("staff_username");
        String password = request.getParameter("staff_password");
        String role = request.getParameter("staff_role");
        boolean active = Boolean.parseBoolean(request.getParameter("staff_active"));

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        StaffDAO staffDAO = new StaffDAO(ConnectionProvider.getConnection());

        User user = new User(username,password,email,role,active);
        Staff staff = new Staff(id,name,email,phone,address,department,gender,salary,user);

        boolean isUserSuccess =  userDAO.addUser(user);
        if (isUserSuccess){
            boolean isStaff_Success=staffDAO.updateStaff(staff);
            pr.write(String.valueOf(isStaff_Success));
        }
        else {
            pr.write("false");
        }
    }
}
