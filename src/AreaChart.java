import java.util.ArrayList;

/**
 * Created by Wing Yu on 2019/4/11 23:11).
 * Blog: http://www.wingyu.org/
 * GitHub: https://github.com/wing324
 * Email: wing.yumin@gmail.com
 */
public class AreaChart implements IChartStrategy{

    private Tools tools = new Tools();
    private ArrayList<String> csvData = tools.CSVReader("record.csv");
    private float[] totalIncome = new float[]{0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f};
    private float[] totalOutcome = new float[]{0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f};
    private float[] totalBalance = new float[]{0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f,0.00f};
    private ArrayList<String> areaData = new ArrayList<String>();
    private String yearPeriod;

    public AreaChart(String yearPeriod) {
        this.yearPeriod = yearPeriod;
    }

    @Override
    public void calculateTotaldata() {
        for(String line : csvData){
            String[] field = line.split(",");
            field[0] = tools.getDate(field[0]);
            String monthField = field[0].substring(5,7);
            if(field[0].substring(0,4).equals(yearPeriod)){
                Float money = Float.parseFloat(field[3]);
                if(field[1].equals("FALSE")){
                    switchMonth(monthField, money, totalIncome);
                } else if(field[1].equals("TRUE")) {
                    switchMonth(monthField, money, totalOutcome);
                } else {
                    System.out.println("The INCOME/OUTCOME type can not match.");
                }
            }
            recursiveTotal();
            calculateTotalBalance();
        }

    }

    @Override
    public void writeData(String filename) {
        for(int i=0; i < 12; i++){
            String timePeriod = yearPeriod + "-" + i;
            areaData.add(timePeriod);
            areaData.add("FALSE");
            areaData.add(String.valueOf(totalIncome[i]));
            tools.CSVWriter(filename, true, areaData);
            areaData.clear();
            areaData.add(timePeriod);
            areaData.add("TRUE");
            areaData.add(String.valueOf(totalOutcome[i]));
            tools.CSVWriter(filename, true, areaData);
            areaData.clear();
            areaData.add(timePeriod);
            areaData.add("BALANCE");
            areaData.add(String.valueOf(totalBalance[i]));
            tools.CSVWriter(filename, true, areaData);
        }


    }

    public void switchMonth(String monthField, Float money, float[] totalCalculator){
        switch (monthField){
            case "01": totalCalculator[0] = totalCalculator[0] + money; break;
            case "02": totalCalculator[1] = totalCalculator[1] + money; break;
            case "03": totalCalculator[2] = totalCalculator[2] + money; break;
            case "04": totalCalculator[3] = totalCalculator[3] + money; break;
            case "05": totalCalculator[4] = totalCalculator[4] + money; break;
            case "06": totalCalculator[5] = totalCalculator[5] + money; break;
            case "07": totalCalculator[6] = totalCalculator[6] + money; break;
            case "08": totalCalculator[7] = totalCalculator[7] + money; break;
            case "09": totalCalculator[8] = totalCalculator[8] + money; break;
            case "10": totalCalculator[9] = totalCalculator[9] + money; break;
            case "11": totalCalculator[10] = totalCalculator[10] + money; break;
            case "12": totalCalculator[11] = totalCalculator[11] + money; break;
            default: break;
        }
    }

    public void recursiveTotal(){
        for(int i = 0; i < 11; i++){
            totalIncome[i+1] = totalIncome[i+1] + totalIncome[i];
            totalOutcome[i+1] = totalOutcome[i+1] + totalOutcome[i];
        }
    }

    public void calculateTotalBalance(){
        for(int i = 0; i < 12; i++){
            totalBalance[i] = totalIncome[i] - totalOutcome[i];
        }
    }
}
