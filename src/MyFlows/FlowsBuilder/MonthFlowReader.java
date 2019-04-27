
import java.util.*;

/**
 * Read and process the flow records from file
 */
public class MonthFlowReader
{
    private String filepath;
    private String month;;//YYYY-MM
    private Tools tools;
 //   private Map<String, ArrayList<String>> incomeTable; 
 //   private Map<String, ArrayList<String>> outcomeTable; 
    private Map<String, ArrayList<String>> flowTable;
    private List<String> dateList; 
    
    public MonthFlowReader(String mon){
        filepath = "data/records.csv";
        month = mon;
        tools = new Tools();
     //   incomeTable = new HashMap<String, ArrayList<String>>();
    //    outcomeTable = new HashMap<String, ArrayList<String>>();
        flowTable = new HashMap<String, ArrayList<String>>();
        dateList = new ArrayList<String>();
        setRecordTable();
    }
    
    public void setRecordTable(){
        ArrayList<String> flows = new ArrayList<String>();
        flows = tools.CSVReader(filepath);
        for (String lines: flows){
            String[] var = lines.split(",");
            var[0] = tools.getDate(var[0]);
            String months = var[0].substring(0,7);
            // get flows of all days in choosen month
            if (months.equals(month)){
                String day = var[0].substring(8,10);
                String flowDetails = var[1] + "," + var[2] + "," + var[3];
                setTableHelper(flowTable,day,flowDetails);
                /*//set incomeTable
                if (var[1].equals("FALSE")){
                    setTableHelper(incomeTable,day,flowDetails);
                }
                //set outcomeTable
                if (var[1].equals("TRUE")){
                    setTableHelper(outcomeTable,day,flowDetails);
                }*/
                
            }
        }    
    }
    
    public void setTableHelper(Map<String, ArrayList<String>> table,
                                                String key, String value){
        ArrayList<String> existVal;
        
        if (table.containsKey(key)){
            existVal = table.get(key);
        } else {
            existVal = new ArrayList<String>();
        }
        existVal.add(value);
        table.put(key,existVal);
    }
   
    public ArrayList<String> sortedRecordDate(){
        ArrayList<String> date = new ArrayList<String>();
        for (int i = 0; i < dateList.size(); i++){
            if (!date.contains(dateList.get(i))){
                date.add(dateList.get(i));
            }
        }
        Collections.sort(date); 
        Collections.reverse(date);
        return date;
    }
    
    public Map<String, ArrayList<String>> getFlows(){
        return flowTable;
    }
    
   /* public Map<String, ArrayList<String>> getIncomeFlow(){
        return incomeTable;
    }
    
    public Map<String, ArrayList<String>> getOutcomeFlow(){
        return outcomeTable;
    }*/
}
