import java.math.BigDecimal;
import java.util.ArrayList;

public class PieChart implements IChartStrategy{
    private Tools tools = new Tools();
    private ArrayList<String> csvData = tools.CSVReader("record.csv");
    private ArrayList<String> pieData = new ArrayList<String>();
    private String timePeriod;
    private BigDecimal totalFood = new BigDecimal(0.00);
    private BigDecimal totalShopping = new BigDecimal(0.00);
    private BigDecimal totalEntertainment = new BigDecimal(0.00);
    private BigDecimal totalHealth = new BigDecimal(0.00);
    private BigDecimal totalHousehold = new BigDecimal(0.00);
    private BigDecimal totalTransportation = new BigDecimal(0.00);
    private BigDecimal totalInsurance = new BigDecimal(0.00);
    private BigDecimal totalIncomeOthers = new BigDecimal(0.00);
    private BigDecimal totalOutcomeOthers = new BigDecimal(0.00);
    private BigDecimal totalSalary = new BigDecimal(0.00);
    private BigDecimal totalRedpacket = new BigDecimal(0.00);
    private BigDecimal totalRefund = new BigDecimal(0.00);
    private BigDecimal totalCash = new BigDecimal(0.00);
    private BigDecimal totalRewards = new BigDecimal(0.00);

    public PieChart(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    @Override
    public void calculateTotaldata(){
        for(String line: csvData){
            String[] field = line.split(",");
            field[0] = tools.getDate(field[0]);
            if(field[0].substring(0,7).equals(timePeriod)){
                if(field[2].equals("FOOD")){
                    totalFood.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("SHOPPING")){
                    totalShopping.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("ENTERTAINMENT")){
                    totalEntertainment.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("HEALTH")){
                    totalHealth.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("HOUSEHOLD")){
                    totalHousehold.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("TRANSPORTATION")){
                    totalTransportation.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("INSURANCE")){
                    totalInsurance.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("SALARY")){
                    totalSalary.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("RED_PACKET")){
                    totalRedpacket.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("REFUND")){
                    totalRefund.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("CASH")){
                    totalCash.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("REWARDS")){
                    totalRewards.add(new BigDecimal(field[3]));
                }
                if(field[2].equals("OTHERS")){
                    if(field[1].equals("TRUE")){
                        totalOutcomeOthers.add(new BigDecimal(field[3]));
                    } else {
                        totalIncomeOthers.add(new BigDecimal(field[3]));
                    }
                }
            }
        }
    }

    @Override
    public void writeData(String filename) {
        if(totalFood.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("FOOD");
            pieData.add(totalFood.toString());
            tools.CSVWriter(filename, false, pieData );
            pieData.clear();
        }
        if(totalShopping.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("SHOPPING");
            pieData.add(totalShopping.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalEntertainment.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("ENTERTAINMENT");
            pieData.add(totalEntertainment.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalHealth.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("HEALTH");
            pieData.add(totalHealth.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalHousehold.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("HOUSEHOLD");
            pieData.add(totalHousehold.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalTransportation.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("TRANSPORTATION");
            pieData.add(totalTransportation.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalInsurance.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("INSURANCE");
            pieData.add(totalInsurance.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalSalary.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("SALARY");
            pieData.add(totalSalary.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalRedpacket.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("RED_PACKET");
            pieData.add(totalRedpacket.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalRefund.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("REFUND");
            pieData.add(totalRefund.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalCash.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("CASH");
            pieData.add(totalCash.toString());
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
        if(totalRewards.compareTo(BigDecimal.ZERO)>0){
            pieData.add(timePeriod);
            pieData.add("REWARDS");
            pieData.add(totalRewards.toString());
            tools.CSVWriter(filename, true, pieData );
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
            tools.CSVWriter(filename, true, pieData );
            pieData.clear();
        }
    }
}
