import java.text.*;

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
    private int testSize = 13;
    private int x_left = 165;
    private int x_right = 215;
    private DecimalFormat df;
    
    public DayHeader(String day, int y_before){
        currentDay = day;
        setY(y_before) ; //monthHeader + blank + r
        dayIncome = 0.0f;
        dayExpense = 0.0f;
        df = new DecimalFormat("0.00");
    }
    
    public void setIncome(float income){
        dayIncome = income;
    }
    
    public void setExpense(float expense){
        dayExpense = expense;
    }
    
    public void circleDraw(){
   // System.err.println("dayHeader_Y: "+ y);
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
        String in = df.format(dayIncome) + " " + "INCOME";
        String exp = "EXPENSE" + " " + df.format(dayExpense) ;
     //   System.err.println("dayIncome: " + in);
     //   System.err.println("dayExpense: " + exp);

        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(RIGHT,CENTER);
        text(in, x_left, y);
        textAlign(LEFT,CENTER);
        text(exp, x_right, y);
    };
   
    
    public void display(){
      //  System.err.println("day: " + currentDay);
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
