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

@WebServlet("/addStaffServlet")
@MultipartConfig
public class addStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();

        String username = request.getParameter("staff_username");
        String name = request.getParameter("staff_name");
        String email = request.getParameter("staff_email");
        String phone = request.getParameter("staff_phone");
        String address = request.getParameter("staff_address");
        String department = request.getParameter("staff_department");
        int salary = Integer.parseInt(request.getParameter("staff_salary"));
        String gender = request.getParameter("staff_gender");

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        StaffDAO staffDAO = new StaffDAO(ConnectionProvider.getConnection());

        User user = new User(username,username,email,"STAFF",true);
        Staff staff = new Staff(name,email,phone,address,department,gender,salary,user);

//        System.out.println(staff);
        boolean isUserSuccess =  userDAO.addUser(user);
        if (isUserSuccess){
            boolean isStaff_Success=staffDAO.addStaff(staff);
            if (!isStaff_Success){
                userDAO.deleteUserByUsername(username);
            }
            pr.write(String.valueOf(isStaff_Success));
        }
        else {
            pr.write("false");
        }
    }

}
