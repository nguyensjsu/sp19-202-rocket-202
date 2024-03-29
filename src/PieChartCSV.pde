import java.math.BigDecimal;
import java.util.ArrayList;

public class PieChartCSV implements IChartCSVStrategy{
    private Tools tools = new Tools();
    /* Processing */
    private ArrayList<String> csvData = tools.CSVReader(dataPath("")+"/records.csv");
    /* Java */
    //private ArrayList<String> csvData = tools.CSVReader("src/data/records.csv");
    private ArrayList<String> pieData = new ArrayList<String>();
    /* timePeriod example: "2019-04"*/
    private String timePeriod;
    private boolean type;
    private BigDecimal totalFood = new BigDecimal("0.00");
    private BigDecimal totalShopping = new BigDecimal("0.00");
    private BigDecimal totalEntertainment = new BigDecimal("0.00");
    private BigDecimal totalHealth = new BigDecimal("0.00");
    private BigDecimal totalHousehold = new BigDecimal("0.00");
    private BigDecimal totalTransportation = new BigDecimal("0.00");
    private BigDecimal totalInsurance = new BigDecimal("0.00");
    private BigDecimal totalIncomeOthers = new BigDecimal("0.00");
    private BigDecimal totalOutcomeOthers = new BigDecimal("0.00");
    private BigDecimal totalSalary = new BigDecimal("0.00");
    private BigDecimal totalRedpacket = new BigDecimal("0.00");
    private BigDecimal totalRefund = new BigDecimal("0.00");
    private BigDecimal totalCash = new BigDecimal("0.00");
    private BigDecimal totalRewards = new BigDecimal("0.00");

    /**
     * Constuctor
     * @param timePeriod String timePeriod like "2019-04"
     * @param type, type is false as income, trus as Expense
     */
    public PieChartCSV(String timePeriod, boolean type) {
        this.timePeriod = timePeriod;
        this.type = type ;
    }

    /* calculate Total data */
    @Override
    public void calculateTotaldata(){
        for(String line: csvData){
            String[] field = line.split(",");
            field[0] = tools.getDate(field[0].trim());
            if(field[0].substring(0,7).equals(timePeriod)){
                if(type && field[1].equals("TRUE")){
                    if(field[2].equals("FOOD")){
                        totalFood = totalFood.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("SHOPPING")){
                        totalShopping = totalShopping.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("ENTERTAINMENT")){
                        totalEntertainment = totalEntertainment.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("HEALTH")){
                        totalHealth = totalHealth.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("HOUSEHOLD")){
                        totalHousehold = totalHousehold.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("TRANSPORTATION")){
                        totalTransportation = totalTransportation.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("INSURANCE")){
                        totalInsurance = totalInsurance.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("OTHERS")){
                        totalOutcomeOthers = totalOutcomeOthers.add(new BigDecimal(field[3]));
                    }
                }
                if(!type && field[1].equals("FALSE")){
                    if(field[2].equals("SALARY")){
                        totalSalary = totalSalary.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("RED_PACKET")){
                        totalRedpacket = totalRedpacket.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("REFUND")){
                        totalRefund = totalRefund.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("CASH")){
                        totalCash = totalCash.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("REWARDS")){
                        totalRewards = totalRewards.add(new BigDecimal(field[3]));
                    }
                    if(field[2].equals("OTHERS")){
                        totalIncomeOthers = totalIncomeOthers.add(new BigDecimal(field[3]));
                    }
                }
            }
        }
    }

    /**
     * Write data to CSV
     * @param filename String
     */
    @Override
    public void writeData(String filename) {
        tools.deleteCSV(filename);
        if(totalFood.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("FOOD");
            pieData.add(totalFood.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalShopping.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("SHOPPING");
            pieData.add(totalShopping.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalEntertainment.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("ENTERTAINMENT");
            pieData.add(totalEntertainment.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalHealth.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("HEALTH");
            pieData.add(totalHealth.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalHousehold.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("HOUSEHOLD");
            pieData.add(totalHousehold.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalTransportation.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("TRANSPORTATION");
            pieData.add(totalTransportation.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalInsurance.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("INSURANCE");
            pieData.add(totalInsurance.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalSalary.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("SALARY");
            pieData.add(totalSalary.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalRedpacket.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("RED_PACKET");
            pieData.add(totalRedpacket.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalRefund.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("REFUND");
            pieData.add(totalRefund.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalCash.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("CASH");
            pieData.add(totalCash.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
        if(totalRewards.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("REWARDS");
            pieData.add(totalRewards.toString());
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }

        if(totalOutcomeOthers.compareTo(BigDecimal.ZERO)>0 || totalIncomeOthers.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("OTHERS");
            if(totalOutcomeOthers.compareTo(BigDecimal.ZERO)>0){
                pieData.add(totalOutcomeOthers.toString());
            } else {
                pieData.add(totalIncomeOthers.toString());
            }
            tools.CSVWriter(filename, pieData );
            pieData.clear();
        }
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllIncome(){
      return "";
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllOutcome(){
      return "";
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllBalance(){
      return "";
    }


}
