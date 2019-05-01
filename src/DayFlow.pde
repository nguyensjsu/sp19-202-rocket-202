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
      items.add(0,item);
   }
 
   public float getIncomeTol(){
      float income = 0.00f;
      for (FlowItem item : items) {
         if (!item.expense()){
          income += item.value();
         }
      }        
      return income/2;
   }
 
   public float getExpenseTol(){
      float expense = 0.00f;
      for (FlowItem item : items) {
         if (item.expense()){
          expense += item.value();
         }
      }        
      return expense/2;
   }   
   
   public void display(){
      head.setY(y-70);
      head.setIncome(getIncomeTol());
      head.setExpense(getExpenseTol());
      head.display();
      y = y;
    //  y = head.getY();
      System.err.println("******begin_single_day_Y: *****"+y);
    //  Collections.reverse(items);
      for (FlowItem item : items) {
         if (item.expense()){
            ExpenseItemDecorator exp = new ExpenseItemDecorator(item);
         //   System.err.println("item_Y_SET: "+ y);
            exp.setY(y);
            exp.display();
          //  y = exp.getY();
            y = y + 70;
          //  System.err.println("item_Y_GET: "+ y);
         } else {
            IncomeItemDecorator in =new IncomeItemDecorator(item);
          //  System.err.println("item_Y_SET: "+ y);
            in.setY(y);
            in.display();
            //y = in.getY();
            y = y + 70;
          //  System.err.println("item_Y_GET: "+ y);
         }
      } 
      System.err.println("****end_single_day_Y: ****"+y);       
   } 
    
   public int getY(){
       return y;
   } 

   public void setY(int y_before){
        y = y_before + 70;
    }
}
