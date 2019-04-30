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
  // cp5 = new ControlP5(papplet);
  pieChartExpense = new ContextChart(new PieChart("EXPENSE"));
  pieChartIncome = new ContextChart(new PieChart("INCOME"));
  lineChart = new ContextChart(new LineChart(papplet));
  currentChart = pieChartExpense;

  // setup Tab font size
  PFont pfont = createFont("arial",16);
  font = new ControlFont(pfont);


  }

  public void display(){
    currentChart.display();
  }

  public void touch(){
    if(mouseY<=30){
      // currentChart.hide();
       if(mouseX>=50 && mouseX<140){
         currentChart = pieChartExpense;
       } else if(mouseX>=140 && mouseX<230){
         currentChart = pieChartIncome;
       } else if(mouseX>=240 && mouseX<320){
         currentChart = lineChart;
       }
      // currentChart.show();
    }
  }

  public void reset(){
    currentChart = pieChartExpense;
    // currentChart.show();
  }

  // public void hide(){
  //   currentChart.hide();
  // }
  //
  // public void show(){
  //   currentChart.show();
  // }

  public void drag(){
	currentChart.drag();
  }
}
