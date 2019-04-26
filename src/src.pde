import controlP5.*;
import java.util.*;

ChartScreen chartScreen;

void setup(){
  size(380, 680);
  chartScreen = new ChartScreen(this);
  }
  
//      void payment(int n) {
//  /* request the selected item based on index n */
//  String out = cp5.get(ScrollableList.class, "payment").getItem(n).get("value").toString();
//  System.out.println(out);
//}

  void draw(){
  //background(255,250,250);
  chartScreen.display();
  //pieChart.display();
  //lineChart.display();
}

  void mouseClicked(){
    print("clicked");
    chartScreen.touch();
    }

//void controlEvent(ControlEvent theControlEvent) {
//  if (theControlEvent.isTab()) {
//    //println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
//    if(theControlEvent.getTab().getId()==1){
//       print(theControlEvent.getTab().getId());
//      //contextChart = new ContextChart(new PieChart(cp5));
//    } else if(theControlEvent.getTab().getId()==2){
//      print(theControlEvent.getTab().getId());
//      //contextChart = new ContextChart(new LineChart(this,cp5));
//    }
//  }
//}
