import java.util.ArrayList;
import java.util.List;
import java.util.*;

/**
 * Build the flows contain each recorded day
 */
public class FlowBuilder implements IFlowSubject//, IDisplayComponent, ITouchEventHandler
{
    private MonthFlowReader reader;
    private IFlowObserver ob;
    private float incomeTol;
    private float expenseTol;
    private String month;
    private Map<String, ArrayList<String>> flowTable;
    private List<String> dateList; 
    private ArrayList<DayFlow> monthflows;
   // private ITouchEventHandler nextHandler;
    private int y;
    
    public FlowBuilder(String mon){
     //   System.err.println("inside flowbuilder");
        month = mon;
        reader = new MonthFlowReader(month);
        
        monthflows = new ArrayList<DayFlow>();
    //    y = 80; //initial 150
        getRecordFromReader();
    }
    
    public void getRecordFromReader(){
        dateList = reader.sortedRecordDate();
      //  System.err.println("dateList: " + dateList);
        flowTable = reader.getFlows();
    }
    
    public ArrayList<DayFlow> MonthFlows(){
        getRecordFromReader();
        for (String day: dateList){
            ArrayList<String> flows = flowTable.get(day);
            monthflows.add(singleDayFlow(day,flows));
        }
        return monthflows;
    } 
    
    public DayFlow singleDayFlow(String day, ArrayList<String> flows){
 //   System.err.println("day_Y_use: "+ y);
        DayFlow dayflow = new DayFlow(day, y);
        for (String flow: flows){
             //   System.err.println("FlowItemInput: "+ flow);
                dayflow.addItem(new FlowItem(flow));
        }
        expenseTol = dayflow.getExpenseTol();
      //  System.err.println("day_expense: "+ expenseTol);
        incomeTol = dayflow.getIncomeTol();
      //  System.err.println("day_income: "+ incomeTol);
        notifyObservers();
      //  y = dayflow.getY() + 70;
      //  System.err.println("day_Y_SET: "+ y);
        return dayflow;
    }
    
    public void attach(IFlowObserver observer){
        ob = observer;
    };
  
    public void notifyObservers(){
        ob.flowSumUpdate(false, incomeTol);
        ob.flowSumUpdate(true, expenseTol);
    };

    public void setY(int y_before){
        y = y_before + 70 ;
    }
    
  /*  public void touch(){
        //pass touch inside items
        if (nextHandler != null){
           nextHandler.touch(); 
        }
    };

    public void setNext(ITouchEventHandler next){
       nextHandler = next;
    };
   
   public void display(){
      for(DayFlow fl: MonthFlows()){
        fl.setY(y);
        fl.display();
        y = fl.getY();
      }
    };

     public void addSubComponent(IDisplayComponent c){};*/
}
