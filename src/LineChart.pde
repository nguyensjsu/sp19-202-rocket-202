import controlP5.*;
import java.util.*;
import org.gicentre.utils.stat.*;

class LineChart implements IChartStrategy{
  ControlP5 cp5;
  ControlFont font;
  PApplet papplet;
  XYChart lineChartPayment;
  XYChart lineChartIncome;
  XYChart lineChartBalance;
  PImage img;
  //ArrayList<String> dataSet;
  float[] yAxis = new float[]{0,0,0,0,0,0,0,0,0,0,0,0};
  float[] dataSets;
  String[] fieldSets;
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
       
       getDataSet("PAYMENT");
       float[] xAxis = new float[] {1,2,3,4,5,6,7,8,9,10,11,12};
       lineChartPayment.setData(xAxis, yAxis);
       getDataSet("INCOME");
       lineChartIncome.setData(xAxis, yAxis);
       getDataSet("BALANCE");
       lineChartBalance.setData(xAxis, yAxis);
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

    
    public void getDataSet(String type){
      count = 0;
      String outputPath = dataPath("")+"/OverviewAccount.csv";      
      ContextCSVChart contextCSVChart = new ContextCSVChart(new LineChartCSV("2019"));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getDataSet(outputPath);
      fieldSets = contextCSVChart.getFieldSet(outputPath);
      for(int i=0; i<fieldSets.length; i++){
        if(fieldSets[i].equals(type)){
          yAxis[count]=dataSets[i];
          count++;
        }
      }
    }

  void display(){
    background(255); 
    image(img,0,0);  
    textSize(9);
    //print("Line Chart");
        
    lineChartPayment.draw(20,130,width-30,height-300);
    lineChartIncome.draw(70,105,width-30,height-300);
    lineChartBalance.draw(70,105,width-30,height-300);
   
  }
  


}
