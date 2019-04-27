import java.util.ArrayList;
import java.util.List;

/**
 * Show the flows records in the particular day
 */
public class DayFlow //implements IHeaderStratedgy, IDisplayComponent, ITouchEventHandler
{
   private List<FlowItem> items = new ArrayList<FlowItem>();    
   private String day;
   private DayHeader head;
   private int y;
   
 //  private float income;
 //  private float outcome;
   
   public DayFlow(String date, int y){
       day = date;
       head = new DayHeader(day,y);
   }
   
   public void addItem(FlowItem item){
      items.add(item);
   }
 
   public float getIncomeTol(){
      float income = 0.00f;
      for (FlowItem item : items) {
         if (!item.expense()){
          income += item.value();
         }
      }        
      return income;
   }
 
   public float getExpenseTol(){
      float expense = 0.00f;
      for (FlowItem item : items) {
         if (item.expense()){
          expense += item.value();
         }
      }        
      return expense;
   }   
   
   public void display(){
      head.setIncome(getIncomeTol());
      head.setExpense(getExpenseTol());
      head.display();
      y = head.getY();
      for (FlowItem item : items) {
         if (item.expense()){
            ExpenseItemDecorator exp = new ExpenseItemDecorator(item);
            exp.setY(y);
            exp.display();
            y = exp.getY();
         } else {
            IncomeItemDecorator in =new IncomeItemDecorator(item);
            in.setY(y);
            in.display();
            y = in.getY();
         }
      }        
   } 
    
   public int getY(){
       return y;
   }
}