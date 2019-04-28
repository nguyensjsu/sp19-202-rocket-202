import java.util.Date;
import java.text.*;

/**
 * MyFlows Screen
 */
public class MyFlows extends Screen
{
  //  private MonthFlowReader reader;
    private String month;
    private SimpleDateFormat df;
    private SpaceLine sl;
    private MonthHeader mh;
    private FlowBuilder fb;
    private ArrayList<DayFlow> flow;
    private int y;
    
    public MyFlows(){
       df = new SimpleDateFormat("yyyy-MM");
       month = df.format(new Date()); //initial set as current month
    //   reader = new MonthFlowReader(Month);
        mh = new MonthHeader(month);
        sl = new SpaceLine();
        fb = new FlowBuilder(month);
        
        fb.attach(mh);
        
        addSubComponent(sl);
        addSubComponent(mh);
      //  addSubComponent(fb);
        System.err.println("finish myflow");
        flow = fb.MonthFlows();
        y = 80;
    }
    
    @Override
    public void display(){
        super.display();
      //  background(255);
      //  sl.display();
     //   mh.display();
      //  fb.display();
      

      System.err.println("*****************first_day_Y: *************"+y);

      for(DayFlow fl: flow){
        fl.setY(y);
        System.err.println("*******get_set_loop_Y: ******"+y);
        fl.display();
        y = fl.getY();
        System.err.println("*******get_end_loop_Y: ******"+y);
      }
      System.err.println("*****************end_day_Y: *************"+y);
      fb.setY(80);
      y = 80;

    }
    
}
