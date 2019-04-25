import controlP5.*;
import java.util.*;

public class ChartScreen{
  

ControlP5 cp5;
ControlFont font;
ContextChart contextChart;
PApplet papplet;

public ChartScreen(PApplet papplet){
  this.papplet = papplet;
  cp5 = new ControlP5(papplet);
  contextChart = new ContextChart(new PieChart(cp5));

  // setup Tab font size
  PFont pfont = createFont("arial",16);
  font = new ControlFont(pfont);

  // create Tab
    Tab tab1 = cp5.getTab("default")
       .activateEvent(true)
       .setLabel("Categories")
       .setPosition(0,0)
       .setSize(190,40)
       .setHeight(40)
       .setId(1)
       ;
     tab1.getCaptionLabel().setFont(font);

    Tab tab2 = cp5.addTab("Trend")
        .activateEvent(true)
        .setPosition(190,0)
        .setSize(190,40)
        .setHeight(40)
        .setId(2)
        ;
    tab2.getCaptionLabel().setFont(font);
    
       // setup Tab font size;
    font = new ControlFont(pfont);
   
  }
  
//      void payment(int n) {
//  /* request the selected item based on index n */
//  String out = cp5.get(ScrollableList.class, "payment").getItem(n).get("value").toString();
//  System.out.println(out);
//}

//  void draw(){
//  //background(255,250,250);
//  contextChart.display();
//  //pieChart.display();
//  //lineChart.display();
//}

  public void display(){
    contextChart.display();
  }

  public void touch(){

  }

  public void drag(){

  }
  
  void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    //println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
    if(theControlEvent.getTab().getId()==1){
      contextChart = new ContextChart(new PieChart(cp5));
    } else if(theControlEvent.getTab().getId()==2){
      contextChart = new ContextChart(new LineChart(papplet,cp5));
    }
  }
}
}
