import controlP5.*;
import java.util.*;

class PieChart{
  ControlP5 cp5;
  ControlFont font;
  Chart pieChart;
  ArrayList<String> dataSet;
  float[] dataSets;
  String[] fieldSets;
  String type;

  public PieChart(ControlP5 cp5){
    this.cp5 = cp5;

    // setup Tab font size
    PFont pfont = createFont("arial",16);
    font = new ControlFont(pfont);

    // setup Scollable List for Year and Month
    List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");
    List monthList = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
    List categories = Arrays.asList("Payment","Income");


    // create a scollable list
     cp5.addScrollableList("2019")
      .setPosition(55,50)
      .setSize(70,100)
      .setBarHeight(40)
      .setItemHeight(30)
      .addItems(yearList)
      .setFont(font)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false)
      ;

    cp5.addScrollableList("4")
      .setPosition(135,50)
      .setSize(50,100)
      .setBarHeight(40)
      .setItemHeight(30)
      .addItems(monthList)
      .setFont(font)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false)
      ;

    cp5.addScrollableList("Payment")
      .setPosition(195,50)
      .setSize(130,100)
      .setBarHeight(40)
      .setItemHeight(30)
      .addItems(categories)
      .setFont(font)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false)
      ;
      
      

    // Create my Pie Chart
    pieChart = createPieChart("Payment Pie Chart");
    getDataSet();
    //pieChart.getColor().setBackground(color(255, 100));
    pieChart.addDataSet("payment");
    //pieChart.setColors("payment", color(244, 89, 66)); //<>//
    pieChart.setData("payment", dataSets);
    pieChart.setStrokeWeight(200);
    
  }
  
  void dropdown() {
  /* request the selected item based on index n */
  int n = (int) cp5.get(ScrollableList.class, "Payment").getValue();
  println(n, cp5.get(ScrollableList.class, "Payment").getItem(n));
  
}

    public Chart createPieChart(String pieChartName){
      return cp5.addChart(pieChartName)
                         .setPosition(90,160)
                         .setSize(200,200)
                         .setView(Chart.PIE)
                         .setLabelVisible(true)
                         .setColorCaptionLabel(color(40));
    }
    
    public void getDataSet(){
      String outputPath = dataPath("")+"/PieChartForPayment.csv";
      ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",true));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getDataSet(outputPath);
      fieldSets = contextCSVChart.getFieldSet(outputPath);
      
    }

    public void display(){
    background(255,255,255);
    println(cp5.get(ScrollableList.class, "Payment").getValue());
    // unshift: add data from left to right (first in)
    for(int i=0; i<dataSets.length; i++){
      pieChart.setColors("payment", color(25*i, 255, 255), color(255, i, 255));
      pieChart.unshift("payment", dataSets[i]);
    }
  }


}
