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
    
    public MyFlows(){
       df = new SimpleDateFormat("yyyy-MM");
       month = df.format(new Date()); //initial set as current month
    //   reader = new MonthFlowReader(Month);
        mh = new MonthHeader(month);
        sl = new SpaceLine();
        fb = new FlowBuilder(month);
        
        fb.attach(mh);
        
        addSubComponent(mh);
        addSubComponent(sl);
        addSubComponent(fb);
    }
    
    
}
