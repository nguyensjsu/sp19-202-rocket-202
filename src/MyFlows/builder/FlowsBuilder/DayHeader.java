
/**
 * Header of Day Flows 
 * Display calculated sum of Daily income & outcome
 */
public class DayHeader implements IHeaderStrategy
{
    private String currentDay;
    private String dayIncome;
    private String dayOutcome;
    
    public DayHeader(String day){
        currentDay = day;
    }
    
    public void setIncome(String income){
        dayIncome = income;
    }
    
    public String outcomeTotal(String outcome){
        dayOutcome = outcome;
    }
    
    public void draw(){
        //income left.center circle show day, outcome right
    };
}
