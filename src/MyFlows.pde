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
int yOffset = 0; 
    
    public MyFlows(){
       df = new SimpleDateFormat("yyyy-MM");
       month = df.format(new Date()); //initial set as current month
    //   reader = new MonthFlowReader(Month);
        sl = new SpaceLine();
        addSubComponent(sl);
        reload();
        y = 80;
    }
    

/* void mousePressed() {
System.err.println("------------mousePressed---------------"+ y);
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
    System.err.println("------------drag---------------"+ y);
  }
}


void mouseReleased() {
System.err.println("------------mouseReleased---------------"+ y);
  locked = false;
} */

    @Override
    public void display(){
        reload();
        
      //  background(255);
      //  sl.display();
        
      //  fb.display();
      
      // Test if the cursor is over the box 
  if ( mouseY > 120 && mousePressed) {
    y = y + mouseY - pmouseY;
    if (y > 80){
      y = 80;
    }
  }
      super.display();
      displayHelper(y);


      noStroke();
      fill(255);
      rect(0,0,380,120);
      stroke(220);
      line(190, 0, 190, 120);
      mh.display();

    }

    void displayHelper(int y1){
      int y = y1;
      fb.setY(y);
      System.err.println("*****************first_day_in_month_Y: *************"+y);

      for(DayFlow fl: flow){
        fl.setY(y);
      //  System.err.println("*******set_dayHeader_Y: ******"+ y);
        fl.display();
        y = fl.getY();
       // System.err.println("*******get_end_day_Y: ******"+y);
      }
      System.err.println("*****************end_month_Y: *************"+y);
     // fb.setY(80);
     // y = 80;

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
      // y = 80;
    }
}
