
/**
 * Header of Day Flows 
 * Display calculated sum of Daily income & outcome
 */
public class DayHeader implements IHeaderStrategy
{
    private String currentDay;
    private float dayIncome;
    private float dayExpense;
    
    public DayHeader(String day){
        currentDay = day;
    }
    
    public void setIncome(float income){
        dayIncome = income;
    }
    
    public void setExpense(float expense){
        dayExpense = expense;
    }
    
    public void draw(){
        //income left.center circle show day, outcome right
    };
}
