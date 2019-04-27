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
 //  private float income;
 //  private float outcome;
   
   public DayFlow(String date){
       day = date;
       head = new DayHeader(day);
   }
   
   public void addItem(FlowItem item){
      items.add(item);
   }
 
   public float getIncomeTol(){
      float income = 0.00f;
      for (FlowItem item : items) {
         if (!item.outcome()){
          income += item.value();
         }
      }        
      return income;
   }
 
   public float getOutcomeTol(){
      float outcome = 0.00f;
      for (FlowItem item : items) {
         if (item.outcome()){
          outcome += item.value();
         }
      }        
      return outcome;
   }   
   
   public void display(){
      head.setIncome(getIncomeTol());
      head.setOutcome(getOutcomeTol());
      head.display();
      for (FlowItem item : items) {
         if (item.outcome()){
           (new OutcomeItemDecorator(item)).display();
         } else {
           (new IncomeItemDecorator(item)).display();
         }
      }        
   }    
}
