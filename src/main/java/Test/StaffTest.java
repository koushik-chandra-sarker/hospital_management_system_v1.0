package Test;

import DAO.StaffDAO;
import Helper.ConnectionProvider;

public class StaffTest {
    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO(ConnectionProvider.getConnection());
        System.out.println(dao.staffCount());

       /* User user = new User();
        user.setUsername("koushik");
        Staff staff= new Staff("Staff2","staff2@gmail.com ","017222222222","address2","dep2","MALE",100000,user);
        boolean f = dao.addStaff(staff);*/

//        System.out.println(dao.getAllStaff());
//        System.out.println(dao.getStaffById(1));
//        System.out.println(dao.getStaffByUsername("user1"));


    }
}
