import java.util.*;

public class ChartScreen extends Screen{
private ChartTemplete pieChartExpense;
private ChartTemplete pieChartIncome;
private ChartTemplete lineChart;
private ChartTemplete currentChart;

/* Constructor */
public ChartScreen(){
  pieChartExpense = new PieChart("EXPENSE");
  pieChartIncome = new PieChart("INCOME");
  lineChart = new LineChart();
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
         setCurrentScreen(pieChartExpense);
       } else if(mouseX>=140 && mouseX<230){
         setCurrentScreen(pieChartIncome);
       } else if(mouseX>=240 && mouseX<320){
         setCurrentScreen(lineChart);
       }
      // currentChart.show();
    }
  }

  /* reset chart screen */
  public void reset(){
    setCurrentScreen(currentChart);
  }

  /* drag chart screen */
  public void drag(){
	currentChart.drag();
  }

  public ChartTemplete setCurrentScreen(ChartTemplete chartTemplete){
    currentChart = chartTemplete;
    return currentChart;
  }
}
