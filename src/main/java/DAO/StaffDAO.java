package DAO;

import Entity.Staff;
import Entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {
    private Connection connection;

    public StaffDAO(Connection connection) {
        this.connection = connection;
    }


    public boolean addStaff(Staff staff){

        boolean f = false;

        try {
            String q = "insert into staff(name, email, phone_no, address, department, sex, salary, username) value(?,?,?,?,?,?,?,?)";
            PreparedStatement pst = connection.prepareStatement(q);

            pst.setString(1,staff.getName());
            pst.setString(2,staff.getEmail());
            pst.setString(3,staff.getPhone_no());
            pst.setString(4,staff.getAddress());
            pst.setString(5,staff.getDepartment());
            pst.setString(6,staff.getSex());
            pst.setInt(7,staff.getSalary());
            pst.setString(8,staff.getUser().getUsername());

            pst.executeUpdate();
            f=true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return f;

    }


    public List<Staff> getAllStaff(){
        List<Staff> staffs = new ArrayList<>();

        try {
            String query = "select staff.*,user.password,user.role,user.active from staff left join user on staff.username=user.username";
            Statement st = this.connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                int id = rst.getInt("id");
                String name = rst.getString("name");
                String email = rst.getString("email");
                String phone_no = rst.getString("phone_no");
                String address = rst.getString("address");
                String department = rst.getString("department");
                String sex = rst.getString("sex");
                int salary = rst.getInt("salary");
                String username = rst.getString("username");
                String password = rst.getString("password");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");
                User user = new User(username,password,role,active);

                Staff staff = new Staff(id,name,email,phone_no,address,department,sex,salary,user);
                staffs.add(staff);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return staffs;
    }

    public Staff getStaffById(int id){
        Staff staff = null;
        try {
            String query = "select staff.*,user.password,user.role, user.active from staff left join user on staff.username=user.username where staff.id=?";

            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1,id);
            ResultSet resultSet = pst.executeQuery();
            if (resultSet.next()){
                staff = new Staff();
                staff.setId(resultSet.getInt("id"));
                staff.setName(resultSet.getString("name"));
                staff.setEmail(resultSet.getString("email"));
                staff.setAddress(resultSet.getString("address"));
                staff.setDepartment(resultSet.getString("department"));
                staff.setPhone_no(resultSet.getString("phone_no"));
                staff.setSalary(resultSet.getInt("salary"));
                staff.setSex(resultSet.getString("sex"));
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String role = resultSet.getString("role");
                boolean active = resultSet.getBoolean("active");
                User user = new User(username,password,role,active);

                staff.setUser(user);

            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return staff;
    }
    public Staff getStaffByUsername(String un){
        Staff staff = null;
        try {
            String query = "select staff.*,user.password,user.role from staff inner join user on staff.username=user.username where staff.username=?";

            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1,un);
            ResultSet resultSet = pst.executeQuery();
            if (resultSet.next()){
                staff = new Staff();
                staff.setId(resultSet.getInt("id"));
                staff.setName(resultSet.getString("name"));
                staff.setEmail(resultSet.getString("email"));
                staff.setAddress(resultSet.getString("address"));
                staff.setDepartment(resultSet.getString("department"));
                staff.setPhone_no(resultSet.getString("phone_no"));
                staff.setSalary(resultSet.getInt("salary"));
                staff.setSex(resultSet.getString("sex"));
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String role = resultSet.getString("role");
                boolean active = resultSet.getBoolean("active");
                User user = new User(username,password,role,active);

                staff.setUser(user);

            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return staff;
    }
    public int staffCount() {

        int totalStaff = 0;
        String query = "SELECT COUNT(id) AS totalStaff FROM staff";
        try {
            Statement st = connection.createStatement();
            ResultSet rst = st.executeQuery(query);
            if (rst.next()){
                totalStaff = rst.getInt("totalStaff");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return totalStaff;
    }

    public boolean updateStaff(Staff staff){
        boolean f= false;
        try {
            String query = "update staff set name =?, email =?,address =?, department =?, phone_no=?, sex=?,salary=? where id =?";

            PreparedStatement pst = this.connection.prepareStatement(query);
            pst.setString(1,staff.getName());
            pst.setString(2,staff.getEmail());
            pst.setString(3,staff.getAddress());
            pst.setString(4,staff.getDepartment());
            pst.setString(5,staff.getPhone_no());
            pst.setString(6,staff.getSex());
            pst.setInt(7,staff.getSalary());
            pst.setInt(8,staff.getId());
            pst.executeUpdate();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteStaffById(int id){
        boolean f= false;
        String query = "delete from staff where id=?";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1,id);
            pst.executeUpdate();
            f=true;
        }catch (SQLException e){
         e.printStackTrace();
        }
        return f;
    }


}
