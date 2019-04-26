
/**
 * Header of MyFlows Screen 
 * Display calculated sum of monthly income & outcome
 */
public class MonthHeader implements IHeaderStrategy, IFlowObject
{
    private String currentMonth;
    private String incomeTotal;
    private String outcomeTotal;
    
    public MonthHeader(String month){
        currentMonth = month;
    }
    
    public void flowSumUpdate(boolean outcome, String sum){
        if (outcome){
            outcomeTotal = sum;
        } else {
            incomeTotal = sum;
        }
    };
    
    public void draw(){
        //income left.center circle show month, outcome right
    };
}
