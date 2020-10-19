package DAO;


import Entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection con ;

    public UserDAO(Connection con) {
        this.con = con;
    }


    public boolean addUser(User user){

        boolean f = false;
        try {

            String query = "insert into user(username,password,email,role,active) value(?,?,?,?,?)";

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,user.getUsername());
            pst.setString(2,user.getPassword());
            pst.setString(3,user.getEmail());
            pst.setString(4,user.getRole());
            pst.setBoolean(5,user.isActive());
            pst.executeUpdate();
            f=true;
         }catch (SQLException e){
            e.printStackTrace();
        }

        return f;
    }
    public List<User> getAllUsers(){
        List<User> users = new ArrayList<>();
        try {
            String query = "select * from user";
            Statement st = this.con.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                String username = rst.getString("username");
                String password = rst.getString("password");
                String email = rst.getString("email");
                String role = rst.getString("role");
                boolean active = rst.getBoolean("active");

                User user = new User(username,password,email,role,active);
                users.add(user);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return users;
    }
    public List<String> getAllUsername(){
        List<String> usernames = new ArrayList<>();
        try {
            String query = "select username from user";
            Statement st = this.con.createStatement();
            ResultSet rst = st.executeQuery(query);
            while (rst.next()){
                String username = rst.getString("username");
                usernames.add(username);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return usernames;
    }

    public User getUserByEmailAndPassword(String email, String password){

        User user1 = null;
        try {

            String query = "select * from user where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,email);
            pst.setString(2,password);
            ResultSet resultSet = pst.executeQuery();

            if(resultSet.next()){
                user1 = new User();
                user1.setUsername(resultSet.getString("username"));
                user1.setEmail(resultSet.getString("email"));
                user1.setPassword(resultSet.getString("password"));
                user1.setRole(resultSet.getString("role"));
                user1.setActive(resultSet.getBoolean("active"));
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return user1;
    }

    public User getUserByUsernameAndPassword(String username, String password){

        User user = null;
        try {

            String query1 = "select * from user where username=? and password=?";
            PreparedStatement pst1 = this.con.prepareStatement(query1);
            pst1.setString(1,username);
            pst1.setString(2,password);
            ResultSet resultSet = pst1.executeQuery();

            if(resultSet.next()){
                user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
                user.setActive(resultSet.getBoolean("active"));
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user){
        boolean f= false;
        try {
            String query = "update user set username = ?, password =?,email = ?, role =?,active=? where username =?";

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,user.getUsername());
            pst.setString(2,user.getPassword());
            pst.setString(3,user.getEmail());
            pst.setString(4,user.getRole());
            pst.setBoolean(5,user.isActive());
            pst.setString(6,user.getUsername());
            pst.executeUpdate();
            f=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }


    public boolean deleteUserByUsername(String username){
        boolean f= false;
        String query = "delete from user where username=?";
        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,username);
            pst.executeUpdate();
            f=true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return f;
    }

}
