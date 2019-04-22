import controlP5.*;
import java.util.*;

class PieChart{
  ControlP5 cp5;
  ControlFont font;
  Chart pieChart;
  ArrayList<String> dataSet;
  Tools tools = new Tools();

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

    pieChart.getColor().setBackground(color(255, 100));
    pieChart.addDataSet("payment");
    pieChart.setColors("payment", color(244, 89, 66),color(217, 65, 244));
    float[] f = {0.76, 0.24, 0.39, 0.18, 0.20}; //<>//
    pieChart.setData("payment", f);
    pieChart.setStrokeWeight(200);
  }

    public Chart createPieChart(String pieChartName){
      return cp5.addChart(pieChartName)
                         .setPosition(90,160)
                         .setSize(200,200)
                         .setView(Chart.PIE);
    }
    
    public void getDataSet(){
      String outputPath = dataPath("")+"/PieChartFoPayment.csv";
      ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",true));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSet = tools.CSVReader(outputPath);
      
    }

    public void display(){
    background(255,250,250);
    // unshift: add data from left to right (first in)
    pieChart.unshift("payment", 0.76);
    pieChart.unshift("payment", 0.24);
    pieChart.unshift("payment", 0.39);
    pieChart.unshift("payment", 0.18);
    pieChart.unshift("payment", 0.20);
  }


}
