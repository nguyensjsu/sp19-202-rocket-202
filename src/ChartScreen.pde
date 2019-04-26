import controlP5.*;
import java.util.*;

public class ChartScreen extends Screen{
  

ControlP5 cp5;
ControlFont font;
ContextChart currentChart;
ContextChart pieChartExpense;
ContextChart pieChartIncome;
ContextChart lineChart;

PApplet papplet;

public ChartScreen(PApplet papplet){
  this.papplet = papplet;
  cp5 = new ControlP5(papplet);
  pieChartExpense = new ContextChart(new PieChartExpense(papplet, cp5));
  pieChartIncome = new ContextChart(new PieChartIncome(papplet, cp5));
  lineChart = new ContextChart(new LineChart(papplet,cp5));
  currentChart = pieChartExpense;

  // setup Tab font size
  PFont pfont = createFont("arial",16);
  font = new ControlFont(pfont);

    
  }

  public void display(){
    
    // create Tab
    //Tab tab1 = cp5.getTab("default")
    //   .activateEvent(true)
    //   .setLabel("Categories")
    //   .setPosition(0,0)
    //   .setSize(width/2,40)
    //   .setHeight(40)
    //   .setId(1)
    //   ;
    // tab1.getCaptionLabel().setFont(font);

    //Tab tab2 = cp5.addTab("Trend")
    //    .activateEvent(true)
    //    .setPosition(width/2,0)
    //    .setSize(width/2,40)
    //    .setHeight(40)
    //    .setId(2)
    //    ;
    //tab2.getCaptionLabel().setFont(font);
    
       // setup Tab font size;
    
    
    
    currentChart.display();
  }

  public void touch(){
    if(mouseY<=30){
       if(mouseX>=50 && mouseX<140){
         currentChart = pieChartExpense;
       } else if(mouseX>=140 && mouseX<230){
         currentChart = pieChartIncome;
       } else if(mouseX>=240 && mouseX<320){
         currentChart = lineChart;
       }
    }
  }

  public void drag(){

  }
  
  
  
  //void controlEvent(ControlEvent theControlEvent) {
  //if (theControlEvent.isTab()) {
  //  //println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
  //  if(theControlEvent.getTab().getId()==1){
  //    print(theControlEvent.getTab().getId());
  //    currentChart = new ContextChart(pieChart);
  //  } else if(theControlEvent.getTab().getId()==2){
  //     print(theControlEvent.getTab().getId());
  //    currentChart = new ContextChart(lineChart);
  //  }
  //  }
  //}
}
