import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 * Created by Wing Yu on 2019/4/11 23:11).
 * Blog: http://www.wingyu.org/
 * GitHub: https://github.com/wing324
 * Email: wing.yumin@gmail.com
 */
public class AreaChart implements IChartStrategy{

    private Tools tools = new Tools();
    private ArrayList<String> csvData = tools.CSVReader("../record.csv");
    private DecimalFormat initialData = new DecimalFormat("0.00");
    private DecimalFormat[] totalIncome = new DecimalFormat[]{initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData};
    private DecimalFormat[] totalOutcome = new DecimalFormat[]{initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData};
    private DecimalFormat[] totalBalance = new DecimalFormat[]{initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData,initialData};
    private String yearPeriod;

    public AreaChart(String yearPeriod) {
        this.yearPeriod = yearPeriod;
    }

    @Override
    public void calculateTotaldata() {
        for(String line : csvData){
            String[] field = line.split(",");
            field[0] = tools.getDate(field[0]);
            if(field[0].substring(0,4).equals(yearPeriod)){
                if(field[1].equals("INCOME")){

                }else{

                }
            }
        }

    }

    @Override
    public void writeData(String filename) {

    }
}
