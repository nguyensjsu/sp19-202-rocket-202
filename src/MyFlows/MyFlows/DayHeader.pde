import java.math.BigDecimal;
/**
 * Header of Day Flows 
 * Display calculated sum of Daily income & outcome
 */
public class DayHeader implements IHeaderStrategy
{
    private String currentDay;
    private float dayIncome;
    private float dayExpense;
    private int width = 380;
    private int x_center = width/2;
    private int y;
    private int r = 15;
    int testSize = 13;
    int x_left = 165;
    int x_right = 215;
    
    public DayHeader(String day, int y_before){
        currentDay = day;
        setY(y_before) ; //monthHeader + blank + r
        dayIncome = 0.0f;
        dayExpense = 0.0f;
    }
    
    public void setIncome(float income){
        dayIncome = income;
    }
    
    public void setExpense(float expense){
        dayExpense = expense;
    }
    
    public void circleDraw(){
        stroke(255,250,250);
        fill(220);
        circle(x_center, y, 2*r);
        
        fill(41,36,33);
        textMode(MODEL);
        textSize(10);
        textAlign(CENTER,CENTER);
        text(currentDay, x_center, y);
    };
    
    public void textDraw(){
        BigDecimal income = new BigDecimal(dayIncome);
        BigDecimal expense = new BigDecimal(dayExpense);
        String in = income + " " + "income";
        String exp = "expense" + " " + expense;
        
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(RIGHT,CENTER);
        text(in, x_left, y);
        textAlign(LEFT,CENTER);
        text(exp, x_right, y);
    };
   
    
    public void display(){
        circleDraw();
        textDraw();
    };
    
    public void setY(int y_before){
        y = y_before + 70;
    }
    
    public int getY(){
       return y;
    }
}
