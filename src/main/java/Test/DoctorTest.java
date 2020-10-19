package Test;

import DAO.DoctorDAO;
import DAO.StaffDAO;
import Entity.AvailableDoctor_all_info;
import Entity.Doctor;
import Helper.ConnectionProvider;
import Helper.DateAndDayCalculator;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DoctorTest {
    public static void main(String[] args) throws ParseException {
        DoctorDAO dao = new DoctorDAO(ConnectionProvider.getConnection());

        List<AvailableDoctor_all_info > availableDoctor_all_info = dao.getAllAvailableDoctorFullInfo("2020-10-25");
        System.out.println(availableDoctor_all_info);
//        List<Doctor> doctor = dao.getAllDoctor();
//        System.out.println(doctor);


        /*String currentDate="18/10/2020";

        int i=5;
        while (i != 0){
            String nextDate = "";
            try {
                Calendar today = Calendar.getInstance();
                DateFormat format=new SimpleDateFormat("dd/MM/yyyy");
                Date date = format.parse(currentDate);
                today.setTime(date);
                today.add(Calendar.DAY_OF_YEAR, 1);
                nextDate = format.format(today.getTime());

                Date dt1=format.parse(nextDate);
                DateFormat format2=new SimpleDateFormat("EEEE");
                String finalDay=format2.format(dt1);
            } catch (Exception e) {
                System.out.println(nextDate);

            }
            System.out.println(nextDate);
            i--;
            currentDate = nextDate;

        }*/

       /* String input_date="01/08/2012";
        SimpleDateFormat format1=new SimpleDateFormat("dd/MM/yyyy");
        Date dt1=format1.parse(currentDate);
        DateFormat format2=new SimpleDateFormat("EEEE");
        String finalDay=format2.format(dt1);
        System.out.println(finalDay);
*/

      /*  List<String> strings = new ArrayList<>();
        strings = DateAndDayCalculator.getSevenDate("2020-10-18");
        System.out.println(strings);*/



    }
}
