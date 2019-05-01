import java.math.BigDecimal;
import java.util.ArrayList;

public class LineChartCSV implements IChartCSVStrategy{
    private Tools tools = new Tools();
    /* Processing */
    private ArrayList<String> csvData = tools.CSVReader(dataPath("")+"/records.csv");
    /* Java */
    //private ArrayList<String> csvData = tools.CSVReader("src/data/records.csv");
    private BigDecimal initialData = new BigDecimal("0.00");
    private BigDecimal[] totalIncome = new BigDecimal[]{initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData};
    private BigDecimal[] totalOutcome = new BigDecimal[]{initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData};
    private BigDecimal[] totalBalance = new BigDecimal[]{initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData, initialData};
    private BigDecimal allIncome = new BigDecimal("0.00");
    private BigDecimal allOutcome = new BigDecimal("0.00");
    private BigDecimal allBalance = new BigDecimal("0.00");
    private ArrayList<String> lineData = new ArrayList<String>();
    /* yearPeriod just a year, like "2019" */
    private String yearPeriod;


    /**
    * Constuctor
    * @param yearPeriod String like '2019'
    */
    public LineChartCSV(String yearPeriod) {
        this.yearPeriod = yearPeriod;
    }

    /**
    * calculate Total data
    */
    @Override
    public void calculateTotaldata() {
        for(String line : csvData){
            String[] field = line.split(",");
            field[0] = tools.getDate(field[0].trim());
            String monthField = field[0].substring(5,7);
            if(field[0].substring(0,4).equals(yearPeriod)){
                BigDecimal money = new BigDecimal(field[3]);
                if(field[1].equals("FALSE")){
                    switchMonth(monthField, money, totalIncome);
                } else if(field[1].equals("TRUE")) {
                    switchMonth(monthField, money, totalOutcome);
                } else {
                    System.out.println("The INCOME/OUTCOME type can not match.");
                }
            }
        }

        calculateTotalBalance();
        recursiveTotal();
    }

    /**
     * Write data to CSV
     * @param filename String
     */
    @Override
    public void writeData(String filename) {
        tools.deleteCSV(filename);
        int len = 0;
        /* Check if it is the current year, the len will be the month, or if it is the year in the future, the len will be the 0 */
        if(yearPeriod.equals(tools.getCurrentYear())){
            len = tools.getCurrentMonth();
        } else if(yearPeriod.compareTo(tools.getCurrentYear())<0){
            len = 12;
        } else {
            len = 0;
        }
          for(int i=0; i < len; i++){
            String timePeriod = yearPeriod + "-" + String.format("%02d", i+1);
            lineData.add(timePeriod);
            // Income
            lineData.add(String.valueOf(totalIncome[i]));
            // Payment
            lineData.add(String.valueOf(totalOutcome[i]));
            // Balance
            lineData.add(String.valueOf(totalBalance[i]));
            tools.CSVWriter(filename, lineData);
            lineData.clear();
        }
        if(len<12){
          for(int j = len; j<12; j++){
            String tp = tools.getCurrentYear() + "-" + String.format("%02d", j+1);
            lineData.add(tp);
            // Income
            lineData.add("0.00");
            // Payment
            lineData.add("0.00");
            // Balance
            lineData.add("0.00");
            tools.CSVWriter(filename, lineData);
            lineData.clear();
          }
        }
    }

    /**
     * get month total
     * @param monthField String
     * @param money BigDecimal
     * @param totalCalculator BigDecimal[]
     */
    public void switchMonth(String monthField, BigDecimal money, BigDecimal[] totalCalculator){
        switch (monthField){
            case "01": totalCalculator[0] = totalCalculator[0].add(money); break;
            case "02": totalCalculator[1] = totalCalculator[1].add(money); break;
            case "03": totalCalculator[2] = totalCalculator[2].add(money); break;
            case "04": totalCalculator[3] = totalCalculator[3].add(money); break;
            case "05": totalCalculator[4] = totalCalculator[4].add(money); break;
            case "06": totalCalculator[5] = totalCalculator[5].add(money); break;
            case "07": totalCalculator[6] = totalCalculator[6].add(money); break;
            case "08": totalCalculator[7] = totalCalculator[7].add(money); break;
            case "09": totalCalculator[8] = totalCalculator[8].add(money); break;
            case "10": totalCalculator[9] = totalCalculator[9].add(money); break;
            case "11": totalCalculator[10] = totalCalculator[10].add(money); break;
            case "12": totalCalculator[11] = totalCalculator[11].add(money); break;
            default: break;
        }
    }

    /**
     * calculate Total Balance
     */
    public void calculateTotalBalance(){
        for(int i = 0; i < 12; i++){
            totalBalance[i] = totalIncome[i].subtract(totalOutcome[i]);
        }
    }

    /**
     * get every month total plus the month before
     */
    public void recursiveTotal(){
        for(int i = 0; i < 11; i++){
            allIncome = allIncome.add(totalIncome[i]);
            allOutcome = allOutcome.add(totalOutcome[i]);
        }
        allBalance = allIncome.subtract(allOutcome);
        System.out.println(allIncome+"  "+allOutcome+"  "+allBalance);
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllIncome(){
      return allIncome.toString();
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllOutcome(){
      return allOutcome.toString();
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllBalance(){
      return allBalance.toString();
    }


}
