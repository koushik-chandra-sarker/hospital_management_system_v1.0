package Helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateAndDayCalculator {
    public static String getDay(String currentDate) throws ParseException {
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Date dt1=format.parse(currentDate);
        DateFormat format2=new SimpleDateFormat("EEEE");
        return format2.format(dt1);
    }

    public static List<String> getSevenDate(String currentDate){
        List<String> sevenDayDate = new ArrayList<>();
        sevenDayDate.add(currentDate);

        int i=6;
        while (i != 0){
            String nextDate = "";
            try {
                Calendar today = Calendar.getInstance();
                DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
                Date date = format.parse(currentDate);
                today.setTime(date);
                today.add(Calendar.DAY_OF_YEAR, 1);
                nextDate = format.format(today.getTime());
            } catch (Exception e) {
                e.printStackTrace();

            }
            sevenDayDate.add(nextDate);
            i--;
            currentDate = nextDate;

        }

        return sevenDayDate;
    }

}
