import controlP5.*;
import java.util.*;
import org.gicentre.utils.stat.*;

class LineChart extends Screen implements IChartStrategy{
  ControlP5 cp5;
  ControlFont font;
  PApplet papplet;
  XYChart lineChartPayment;
  XYChart lineChartIncome;
  XYChart lineChartBalance;
  PImage img;
  //ArrayList<String> dataSet;
  float[] yPayment;
  float[] yIncome;
  float[] yBalance;
  String[] monthSets;
  String month;
  int count=0;

  public LineChart(PApplet papplet, ControlP5 cp5){
    this.cp5 = new ControlP5(papplet);
   // this.cp5 = cp5;
    this.papplet = papplet;
    img = loadImage("img/chart_monthly.png");
    // setup Tab font size
    PFont pfont = createFont("arial",16);
    font = new ControlFont(pfont);

    //List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");

     //// create LineChart scollable list
     //cp5.addScrollableList("lineChartYear")
     // .setPosition(160,650)
     // .setSize(70,100)
     // .setLabel("2019")
     // .setBarHeight(40)
     // .setItemHeight(30)
     // .addItems(yearList)
     // .setFont(font)
     // .setType(ScrollableList.DROPDOWN)
     // .setOpen(false)
     // ;

    // Both x and y data set here.
      lineChartPayment = new XYChart(papplet);
      lineChartIncome = new XYChart(papplet);
      lineChartBalance = new XYChart(papplet);
       chartFormat(lineChartPayment,true);
       lineChartPayment.setLineColour(color(173,255,47));
       chartFormat(lineChartIncome,false);
       lineChartIncome.setLineColour(color(255,0,255));
       chartFormat(lineChartBalance,false);
       lineChartBalance.setLineColour(color(255,255,0));

       float[] xAxis = new float[] {1,2,3,4,5,6,7,8,9,10,11,12};
       getDataSet();
       lineChartIncome.setData(xAxis, yIncome);
       lineChartPayment.setData(xAxis, yPayment);
       lineChartBalance.setData(xAxis, yBalance);
       lineChartPayment.setXAxisLabel("Month");
       lineChartPayment.setYAxisLabel("Money");

  }

    public void hide(){
      //lineChartPayment.setVisible(false);
    }

    public void show(){
      //lineChartPayment.setVisible(true);
    }

  public void chartFormat(XYChart xyChart, boolean showAxis){
    // Axis formatting and labels.
      xyChart.setPointColour(color(0,0,0));
      xyChart.showXAxis(showAxis);
      xyChart.showYAxis(showAxis);
      xyChart.setMinX(1);

      xyChart.setYFormat("$###,###");  // Monetary value in $US
      xyChart.setXFormat("00");      // Year

      // Symbol colours
      //xyChart.setPointColour(color(180,50,50,100));
      xyChart.setPointSize(5);
      xyChart.setLineWidth(3);
  }

      public void showBottomList(){
        count = 0;
        singleList(520, "Month","Income", "Expense","Balance");
      for(int i=0; i< 12; i++){
        if(yPayment[i]!=0 || yIncome[i]!=0 || yBalance[i]!=0){
          count = count+1;
          month = month(i+1);
          singleList(520+30*count+20*count, month, String.valueOf(yIncome[i]),String.valueOf(yPayment[i]),String.valueOf(yBalance[i]));
        } else {
          // do nothing
        }
      }
    }


    public void getDataSet(){
      count = 0;
      String outputPath = dataPath("")+"/OverviewAccount.csv";
      ContextCSVChart contextCSVChart = new ContextCSVChart(new LineChartCSV("2019"));
      contextCSVChart.excuteCSVStrategy(outputPath);
      monthSets = contextCSVChart.getFieldSet(outputPath, 0);
      yIncome = contextCSVChart.getValueSet(outputPath, 1);
      yPayment = contextCSVChart.getValueSet(outputPath, 2);
      yBalance = contextCSVChart.getValueSet(outputPath, 3);
    }

  void display(){
    background(255);
    image(img,0,0);
    textSize(9);

    lineChartPayment.draw(20,130,width-30,height-300);
    lineChartIncome.draw(70,105,width-30,height-300);
    lineChartBalance.draw(70,105,width-30,height-300);

    showBottomList();

  }

  public String month(int m){
    switch(m){
      case 1: month = "Jan."; break;
      case 2: month = "Feb."; break;
      case 3: month = "Mar."; break;
      case 4: month = "Apr."; break;
      case 5: month = "May"; break;
      case 6: month = "June"; break;
      case 7: month = "July"; break;
      case 8: month = "Aug."; break;
      case 9: month = "Sep."; break;
      case 10: month = "Oct."; break;
      case 11: month = "Nov."; break;
      case 12: month = "Dec."; break;
    }
    return month;
  }

  public void singleList(float h,String s1, String s2, String s3, String s4){
    line(0,h,380,h);
    h = h+20;
    textSize(20);
    textAlign(LEFT, CENTER);
    fill(0,0,0);
    text(s1,10,h);
    textAlign(CENTER, CENTER);
    text(s2,120,h);
    textAlign(CENTER, CENTER);
    text(s3,220,h);
    textAlign(CENTER, CENTER);
    text(s4,320,h);
  }



}
