import java.math.BigDecimal;
import java.util.ArrayList;

public class ChartCSVMain {
    public static void main(String[] args) {
        /* PieChart Test */
//        ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",true));
//        contextCSVChart.excuteCSVStrategy("src/data/PieChartForPayment.csv");

        /* LineChart Test */
//        ContextCSVChart contextCSVChart = new ContextCSVChart(new LineCSVChart("2019"));
//        contextCSVChart.excuteCSVStrategy("src/data/OverviewAccount.csv");

        /* Tool Test */
//        Tools tools = new Tools();
//        System.out.println(tools.getCurrentYear());
//        System.out.println(tools.getCurrentMonth());

//        BigDecimal bd1 = new BigDecimal("12.00");
////        BigDecimal bd2 = new BigDecimal("4.00");
////        BigDecimal bd3 = bd2.divide(bd1, 2);
////        System.out.println(bd3);

        /* CSVReader test case */
        Tools tools = new Tools();
        ArrayList<String> csv = tools.CSVReader("src/data/PieChartForPayment.csv");
        for(int i=0; i < csv.size(); i++){
//            System.out.println(csv.get(i));
            System.out.println(csv.get(i).split(",")[2]);
        }

    }
}
