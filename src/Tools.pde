import java.io.BufferedReader;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

public class Tools {

    Calendar cal = Calendar.getInstance();

    /* Convert unix_timestamp to "YYYY-MM-dd"*/
    public String getDate(String unix_timestamp){
        Long long_timestamp = Long.parseLong(unix_timestamp.trim());
        Date date = new Date(long_timestamp);
        /* Format Date */
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("GMT-7"));
        /* Return String type Date format*/
        return sdf.format(date);
    }

    /* Get current Year */
    public String getCurrentYear(){
        return String.valueOf(cal.get(Calendar.YEAR));
    }

    /* Get current Month */
    public int getCurrentMonth(){
        return cal.get(Calendar.MONTH )+1;
    }

    /* Return CSV record as Array */
    public ArrayList<String> CSVReader(String filename){
        ArrayList<String> csvContent = new ArrayList<String>();
        try{
            BufferedReader reader = new BufferedReader(new FileReader(filename));
            String line = null;
            while((line=reader.readLine())!=null){
                csvContent.add(line) ;
            }
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return csvContent;
    }

    /* Write record to CSV */
    public void CSVWriter(String filename, ArrayList<String> fields) {
        try {
            File csv = new File(filename);
            if (!csv.exists()) {
                csv.createNewFile();
            }
            BufferedWriter bw = new BufferedWriter(new FileWriter(csv, true));
            bw.write(String.join(",", fields));
            bw.newLine();
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* Delete File */
    public void deleteCSV(String filename){
        File file = new File(filename);
        if(file.exists()){
            file.delete();
        }
    }

//    public static void main(String[] args) {
//        Tools tool = new Tools();
//        /* getDate test case */
//        System.out.println(tool.getDate("1554891010"));
//
//        /* CSVReader test case */
//        ArrayList<String> csv = tool.CSVReader("src/record/record.csv");
//        for(int i=0; i < csv.size(); i++){
//            System.out.println(csv.get(i));
//        }
//
//        /* CSVWriter test case */
//       ArrayList<String> s = new ArrayList<String>();
//        s.add("Paul");
//        s.add("202");
//        s.add("Rocket");
//        tool.CSVWriter("src/record/test.csv",false, s);

        /* Delete CSV File */
//        tool.deleteCSV("src/record/PieChartForOutcome.csv");
//    }

}
