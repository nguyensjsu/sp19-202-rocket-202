import java.math.BigDecimal;
/**
 * Header of MyFlows Screen 
 * Display calculated sum of monthly income & outcome
 */
public class MonthHeader implements IHeaderStrategy, IFlowObserver,IDisplayComponent,ITouchEventHandler
{
    private String currentMonth;
    private float incomeTotal;
    private float expenseTotal;
    private ITouchEventHandler nextHandler;
    private int width = 380;
    private int x_center = width/2;
    private int y;
    private int r = 30;
    int testSize = 13;
        
    public MonthHeader(String month){
        currentMonth = month;
        y = 60;
        incomeTotal = 0.0f;
        expenseTotal = 0.0f;
    }
    
    public void flowSumUpdate(boolean expense, float sum){
        if (expense){
            expenseTotal = sum;
        } else {
            incomeTotal = sum;
        }
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
    
    public void circleDraw(){
        noStroke(); 
        fill(135,206,247);
        circle(x_center,y, 2*r);
        
        fill(255,250,250);
        textMode(MODEL);
        textSize(testSize-1);
        textAlign(CENTER,CENTER);
        text(currentMonth, x_center, y);
    };
    
    public void textDraw(){
        BigDecimal income = new BigDecimal(incomeTotal);
        BigDecimal expense = new BigDecimal(expenseTotal);
        
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(CENTER,CENTER);
        text("Monthly Income", (x_center-r)/2, y-10);
        text(income, (x_center-r)/2, y+8);
        text("Monthly Expense", width - (x_center-r)/2, y-10);
        text(expense,  width -(x_center-r)/2, y+8);
    };
   
    
    public void display(){
        circleDraw();
        textDraw();
    };

    public void addSubComponent(IDisplayComponent c){};
}
