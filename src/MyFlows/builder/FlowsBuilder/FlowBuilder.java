
import java.util.*;
/**
 * Build the flows contain each recorded day
 */
public class FlowBuilder implements IFlowSubject,IDisplayComponent, ITouchEventHandler
{
    private MonthFlowReader reader;
    private IFlowObserver ob;
    private String incomeTol;
    private String outcomeTol;
    private String month;
  //  private Map<String, ArrayList<String>> incomeTable; 
  //  private Map<String, ArrayList<String>> outcomeTable; 
    private Map<String, ArrayList<String>> flowTable;
    private List<String> dateList; 
    private ITouchEventHandler nextHandler;
    
    public FlowBuilder(String mon){
        month = mon;
        reader = new MonthFlowReader(month);
     //   getRecordFromReader();
    }
    
    public void getRecordFromReader(){
     //   incomeTable = reader.getIncomeFlow();
      //  outcomeTable = reader.getOutcomeFlow();
        dateList = reader.sortedRecordDate();
    }
    
    public ArrayList<DayFlow> creatMonthFlows(){
        getRecordFromReader();
        ArrayList<DayFlow> monthflows = new ArrayList<DayFlow>();
        for (String day: dateList){
          //  ArrayList<String> income = incomeTable.get(day);
          //  ArrayList<String> outcome = outcomeTable.get(day);
            ArrayList<String> flows = flowTable.get(day);
            monthflows.add(singleDayFlow(day,flows));
        }
    }
    
    public DayFlow singleDayFlow(String day, ArrayList<String> flows){
        DayFlow dayflow = new DayFlow(day);
        for (String flow: flows){
            dayflow.addItem(new FlowItem(flow));
        }
        outcomeTol = dayflow.getOutcomeTol();
        incomeTol = dayflow.getIncomeTol();
        notifyObservers();
        return dayflow;
    }
    
    public void attach(IFlowObserver observer){
        ob = observer;
    };
  
    public void notifyObservers(){
        ob.flowSumUpdate(false, incomeTol);
        ob.flowSumUpdate(true, outcomeTol);
    };
    
    public void touch(){
        //pass touch inside items
        if (nextHandler != null){
           nextHandler.touch(); 
        }
    };

    public void setNext(ITouchEventHandler next){
       nextHandler = next;
    };
   
    public void display(){};

    public void addSubComponent(IDisplayComponent c){};
}
