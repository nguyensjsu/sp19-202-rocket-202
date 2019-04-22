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
    public String[] getFieldSet(String filename){
        ArrayList<String> fieldSets = tools.CSVReader(filename);
        String[] fieldSetString = new String[fieldSets.size()];
        for(int i=0; i<fieldSets.size(); i++){
            fieldSetString[i] = fieldSets.get(i).split(",")[1];
        }
        return fieldSetString;
    }

    public float[] getDataSet(String filename){
        ArrayList<String> dataSets = tools.CSVReader(filename);
        float[] dataSetFloat = new float[dataSets.size()];
        BigDecimal dataSum = BigDecimal.ZERO;
        for(int i=0; i<dataSets.size(); i++){
            dataSum = dataSum.add(new BigDecimal(dataSets.get(i).split(",")[2]));
        }
        for(int i=0; i<dataSets.size(); i++){
            dataSetFloat[i] = new BigDecimal(dataSets.get(i).split(",")[2]).divide(dataSum,2).floatValue();
        }
        return dataSetFloat;
    }
}
