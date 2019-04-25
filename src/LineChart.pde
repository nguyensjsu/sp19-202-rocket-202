import controlP5.*;
import java.util.*;
import org.gicentre.utils.stat.*;

class LineChart{
  ControlP5 cp5;
  ControlFont font;
  XYChart lineChartPayment;
  XYChart lineChartIncome;
  XYChart lineChartBalance;
  //ArrayList<String> dataSet;
  float[] yAxis = new float[]{0,0,0,0,0,0,0,0,0,0,0,0};
  float[] dataSets;
  String[] fieldSets;
  int count=0;

  public LineChart(PApplet papplet, ControlP5 cp5){
    this.cp5 = cp5;
    papplet.stroke(0);

    // setup Tab font size
    PFont pfont = createFont("arial",16);
    font = new ControlFont(pfont);

    // setup Scollable List for Year
    List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");

    // create a scollable list
     cp5.addScrollableList("2019")
      .setPosition(160,50)
      .setSize(70,100)
      .setBarHeight(40)
      .setItemHeight(30)
      .addItems(yearList)
      .setFont(font)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false)
      ;
      
    // Both x and y data set here.  
      lineChartPayment = new XYChart(papplet);
      lineChartIncome = new XYChart(papplet);
      lineChartBalance = new XYChart(papplet);
       chartFormat(lineChartPayment,true);
       lineChartPayment.setPointColour(color(173,255,47));
       chartFormat(lineChartIncome,false);
       lineChartIncome.setPointColour(color(255,0,255));
       chartFormat(lineChartBalance,false);
       lineChartBalance.setPointColour(color(255,255,0));
       
       getDataSet("PAYMENT");
       float[] xAxis = new float[] {1,2,3,4,5,6,7,8,9,10,11,12};
       lineChartPayment.setData(xAxis, yAxis);
       lineChartPayment.setXAxisLabel("Month");
       lineChartPayment.setYAxisLabel("Money");

  }
  
  public void chartFormat(XYChart xyChart, boolean showAxis){
    // Axis formatting and labels.
      xyChart.showXAxis(showAxis); 
      xyChart.showYAxis(showAxis); 
      xyChart.setMinY(1); 
      
      xyChart.setYFormat("$###,###");  // Monetary value in $US
      xyChart.setXFormat("00");      // Year
       
      // Symbol colours
      //xyChart.setPointColour(color(180,50,50,100));
      xyChart.setPointSize(5);
      xyChart.setLineWidth(2);
  }

    
    public void getDataSet(String type){
      String outputPath = dataPath("")+"/OverviewAccount.csv";      
      ContextCSVChart contextCSVChart = new ContextCSVChart(new LineChartCSV("2019"));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getDataSet(outputPath);
      fieldSets = contextCSVChart.getFieldSet(outputPath);
      for(int i=0; i<fieldSets.length; i++){
        System.out.println(fieldSets[i]);
        System.out.println(dataSets[i]);
        if(fieldSets[i].equals(type)){
          yAxis[count]=dataSets[i];
          count++;
        }
      }
    }

  void display(){
    background(255,255,255);  
    textSize(9);
    lineChartPayment.draw(20,130,width-30,height-300);
   
    // Draw a title over the top of the chart.
    fill(120);
    //textSize(20);
    //text("Income per person, United Kingdom", 20,130);
    //textSize(11);
    //text("Gross domestic product measured in inflation-corrected $US",20,30);
  }
  
//  void payment(int n) {
//  /* request the selected item based on index n */
//  String out = cp5.get(ScrollableList.class, "payment").getItem(n).get("value").toString();
//  System.out.println(out);
//}


}
