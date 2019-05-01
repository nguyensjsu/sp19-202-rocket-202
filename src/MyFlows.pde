import java.util.Date;
import java.text.*;

/**
 * MyFlows Screen
 */
public class MyFlows extends Screen
{
    private String month;
    private SimpleDateFormat df;
    private SpaceLine sl;
    private MonthHeader mh;
    private FlowBuilder fb;
    private ArrayList<DayFlow> flow;
    private int y;
    PImage img_end;
    
    public MyFlows(){
       df = new SimpleDateFormat("yyyy-MM");
       month = df.format(new Date()); //initial set as current month
       sl = new SpaceLine();
       addSubComponent(sl);
       reload();
       y = 80;
       img_end = loadImage("img/flow_end.png");
    }

    @Override
    public void display(){
        reload();

      // check if the cursor is over the screen
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

    //  System.err.println("*****************first_day_in_month_Y: *************"+y);
      for(DayFlow fl: flow){
        fl.setY(y);
      //  System.err.println("*******set_dayHeader_Y: ******"+ y);
        fl.display();
        y = fl.getY();
       // System.err.println("*******get_end_day_Y: ******"+y);
      }
      System.err.println("*****************end_month_Y: *************"+y);

      stroke(255);
      line(190, y+70, 190, 10000);
      imageMode(CENTER);
      image(img_end, 190, y+70, 32, 28);
      textSize(12);
      textAlign(CENTER,CENTER);
      text("End of This Month", 190, y+100);
    
     // fb.setY(80);
     // y = 80;
    }
    
    public void reload(){
        mh = new MonthHeader(month);
        fb = new FlowBuilder(month);
        
        fb.attach(mh);

      //  addSubComponent(mh);
      //  addSubComponent(fb);
      //  System.err.println("finish myflow");
        flow = fb.MonthFlows();
      //  y = 80;
    }
}
