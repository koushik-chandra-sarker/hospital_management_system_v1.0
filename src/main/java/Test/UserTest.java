package Test;

import DAO.UserDAO;
import Helper.ConnectionProvider;

public class UserTest {
    public static void main(String[] args) {
        UserDAO dao = new UserDAO(ConnectionProvider.getConnection());

//        User user = new User("user1","1234","user1@gmail.com","USER");
//        boolean f = dao.addUser(user);

//        System.out.println(dao.getUserByUsernameAndPassword("user1","1234"));
//        System.out.println(dao.getUserByEmailAndPassword("user1@gmail.com","1234"));

        /*User user = new User("user1","user1","user1@gmail.com","USER");
        System.out.println(dao.updateUser(user));*/
        dao.deleteUserByUsername("staff7");


    }
}
