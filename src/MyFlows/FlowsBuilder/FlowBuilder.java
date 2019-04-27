
import java.util.*;
/**
 * Build the flows contain each recorded day
 */
public class FlowBuilder implements IFlowSubject,IDisplayComponent, ITouchEventHandler
{
    private MonthFlowReader reader;
    private IFlowObserver ob;
    private float incomeTol;
    private float expenseTol;
    private String month;
  //  private Map<String, ArrayList<String>> incomeTable; 
  //  private Map<String, ArrayList<String>> outcomeTable; 
    private Map<String, ArrayList<String>> flowTable;
    private List<String> dateList; 
    private ITouchEventHandler nextHandler;
    private int y;
    
    public FlowBuilder(String mon){
        month = mon;
        reader = new MonthFlowReader(month);
        y = 150; //initial 150
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
        return monthflows;
    }
    
    public DayFlow singleDayFlow(String day, ArrayList<String> flows){
        DayFlow dayflow = new DayFlow(day, y);
        for (String flow: flows){
            dayflow.addItem(new FlowItem(flow));
        }
        expenseTol = dayflow.getExpenseTol();
        incomeTol = dayflow.getIncomeTol();
        notifyObservers();
        return dayflow;
    }
    
    public void attach(IFlowObserver observer){
        ob = observer;
    };
  
    public void notifyObservers(){
        ob.flowSumUpdate(false, incomeTol);
        ob.flowSumUpdate(true, expenseTol);
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
   
    public void display(){
        for (String day: dateList){
            ArrayList<String> flows = flowTable.get(day);
            DayFlow flow = singleDayFlow(day,flows);
            flow.display();
            y = flow.getY();
        }
    };

    public void addSubComponent(IDisplayComponent c){};
}
