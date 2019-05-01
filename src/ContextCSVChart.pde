import java.math.BigDecimal;
import java.util.ArrayList;

public class ContextCSVChart {
    private IChartCSVStrategy chartCSVStrategy;
    Tools tools = new Tools();

    public ContextCSVChart(IChartCSVStrategy chartCSVStrategy) {
        this.chartCSVStrategy = chartCSVStrategy;
    }

    public void excuteCSVStrategy(String filename){
        chartCSVStrategy.calculateTotaldata();
        chartCSVStrategy.writeData(filename);
    }

    /* the field the same as Categories */
    public String[] getFieldSet(String filename, int index){
        ArrayList<String> fieldSets = tools.CSVReader(filename);
        String[] fieldSetString = new String[fieldSets.size()];
        for(int i=0; i<fieldSets.size(); i++){
            fieldSetString[i] = fieldSets.get(i).split(",")[index];
        }
        return fieldSetString;
    }

    public float[] getValueSet(String filename, int index){
        ArrayList<String> dataSets = tools.CSVReader(filename);
        float[] dataSetFloat = new float[dataSets.size()];
        //BigDecimal dataSum = BigDecimal.ZERO;
        for(int i=0; i<dataSets.size(); i++){
            dataSetFloat[i] = new BigDecimal(dataSets.get(i).split(",")[index]).floatValue();
        }
        return dataSetFloat;
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllIncome(){
      return chartCSVStrategy.getAllIncome();
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllOutcome(){
      return chartCSVStrategy.getAllOutcome();
    }

    /**
     * get allIncome variables
     * @return String
     */
    public String getAllBalance(){
      return chartCSVStrategy.getAllBalance();
    }
}
