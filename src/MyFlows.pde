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


int boxSize = 480;
boolean overBox = false;
boolean locked = false;
int yOffset = 0.0; 
    
    public MyFlows(){
       df = new SimpleDateFormat("yyyy-MM");
       month = df.format(new Date()); //initial set as current month
    //   reader = new MonthFlowReader(Month);
        sl = new SpaceLine();
        addSubComponent(sl);
        reload();
    }
    

void mousePressed() {
  if(overBox) { 
    locked = true; 
  } else {
    locked = false;
  }
  yOffset = mouseY-y; 

}

void mouseDragged() {
  if(locked) {
    y = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}

    @Override
    public void display(){
        reload();
        super.display();
      //  background(255);
      //  sl.display();
        
      //  fb.display();
      
      // Test if the cursor is over the box 
  if ( mouseY > 120) {
    overBox = true;  
    if(!locked) { 
     
    } 
  } else {
    overBox = false;
  }

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


      noStroke();
      fill(255);
      rect(0,0,380,120);
      stroke(220);
      line(190, 0, 190, 120);
      mh.display();

    }
    
    public void reload(){
    //   reader = new MonthFlowReader(Month);
        mh = new MonthHeader(month);
        
        fb = new FlowBuilder(month);
        
        fb.attach(mh);
        
        
      //  addSubComponent(mh);
      //  addSubComponent(fb);
        System.err.println("finish myflow");
        flow = fb.MonthFlows();
        y = 80;
    }
}
