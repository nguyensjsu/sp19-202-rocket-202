
/**
 * Header of MyFlows Screen 
 * Display calculated sum of monthly income & outcome
 */
public class MonthHeader implements IHeaderStrategy, IFlowObserver,IDisplayComponent,ITouchEventHandler
{
    private String currentMonth;
    private float incomeTotal;
    private float outcomeTotal;
    private ITouchEventHandler nextHandler;
    
    public MonthHeader(String month){
        currentMonth = month;
    }
    
    public void flowSumUpdate(boolean outcome, float sum){
        if (outcome){
            outcomeTotal = sum;
        } else {
            incomeTotal = sum;
        }
    };
    
    public void draw(){
        //income left.center circle show month, outcome right
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
