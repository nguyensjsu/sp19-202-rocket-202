import java.util.*;

public class ChartScreen extends Screen{
ContextChart currentChart;
ContextChart pieChartExpense;
ContextChart pieChartIncome;
ContextChart lineChart;

PApplet papplet;

/* Constructor */
public ChartScreen(){
  pieChartExpense = new ContextChart(new PieChart("EXPENSE"));
  pieChartIncome = new ContextChart(new PieChart("INCOME"));
  lineChart = new ContextChart(new LineChart());
  currentChart = pieChartExpense;
  }

 /* display chart screen */
  public void display(){
    currentChart.display();
  }

  /* touch method */
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

  /* reset chart screen */
  public void reset(){
    currentChart = pieChartExpense;
  }

  /* drag chart screen */
  public void drag(){
	currentChart.drag();
  }
}
