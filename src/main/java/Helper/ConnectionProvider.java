package Helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

    public static Connection con;
    public static Connection getConnection(){

        try {
            if (con==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/hms","root","0000");
            }


        }catch (Exception e){
            e.printStackTrace();
        }




        return con;
    }
}
