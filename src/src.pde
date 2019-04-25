import controlP5.*;
import java.util.*;

ControlP5 cp5;
ControlFont font;
PieChart pieChart;
LineChart lineChart;

void setup(){
  size(380, 680);
  cp5 = new ControlP5(this);
  //pieChart = new PieChart(cp5);
  lineChart = new LineChart(this,cp5);

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


  }
  
//      void payment(int n) {
//  /* request the selected item based on index n */
//  String out = cp5.get(ScrollableList.class, "payment").getItem(n).get("value").toString();
//  System.out.println(out);
//}

  void draw(){
  //background(255,250,250);
  //pieChart.display();
  lineChart.display();
}
