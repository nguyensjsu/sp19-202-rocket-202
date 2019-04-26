import controlP5.*;
import java.util.*;

class PieChart implements IChartStrategy{
  ControlP5 cp5;
  ControlFont font;
  Chart pieChart;
  //ArrayList<String> dataSet;
  float[] dataSets;
  String[] fieldSets;
  String type;

  public PieChart(PApplet papplet,ControlP5 cp5){
    this.cp5 = cp5;    //<>//
    //this.cp5 = new ControlP5(papplet);
    // setup Tab font size
    PFont pfont = createFont("arial",16);
    font = new ControlFont(pfont);
    // setup Scollable List for Year and Month
    List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");
    List monthList = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
    List categories = Arrays.asList("Payment","Income");
    
    // create pieChart scollable list
     cp5.addScrollableList("pieChartYear")
      .setPosition(55,50)
      .setLabel("2019")
      .setSize(70,100)
      .setBarHeight(40)
      .setItemHeight(30)
      .addItems(yearList)
      .setFont(font)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false)
      ;

    cp5.addScrollableList("pieChartMonth")
      .setPosition(135,50)
      .setSize(50,100)
      .setLabel("4")
      .setBarHeight(40)
      .setItemHeight(30)
      .addItems(monthList)
      .setFont(font)
      .setType(ScrollableList.DROPDOWN)
      .setOpen(false)
      ;

    cp5.addScrollableList("payment")
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
    
  }

    public Chart createPieChart(String pieChartName){
      return cp5.addChart(pieChartName)
                         .setPosition(90,160)
                         .setSize(200,200)
                         .setView(Chart.PIE)
                         .setLabelVisible(true)
                         .setStrokeWeight(200)
                         .setColorCaptionLabel(color(40));
    }
    
    public void getDataSet(){
      String outputPath = null;
      boolean categoriesTpe = true;
      //println(cp5.get(ScrollableList.class, "Payment").getValue());
      if(cp5.get(ScrollableList.class, "payment").getValue() == 0.0){
        outputPath = dataPath("")+"/PieChartForPayment.csv";
        categoriesTpe = true;
      } else if(cp5.get(ScrollableList.class, "payment").getValue() == 1.0){
        outputPath = dataPath("")+"/PieChartForIncome.csv";
        categoriesTpe = false;
      }
      
      ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",categoriesTpe));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getDataSet(outputPath);
      fieldSets = contextCSVChart.getFieldSet(outputPath);
      float[] dataSetFloat = new float[dataSets.length];
      BigDecimal dataSum = BigDecimal.ZERO;
        
        for(int i=0; i<dataSets.length; i++){
            dataSum = dataSum.add(new BigDecimal(dataSets[i]));
        }
        for(int i=0; i<dataSets.length; i++){
            dataSetFloat[i] = new BigDecimal(dataSets[i]).divide(dataSum,2).floatValue();
        }
      dataSets = dataSetFloat;
    }

  void display(){
    background(255,255,255);  
    //print("Pie Chart");
    // set data for pie chart
    getDataSet();
    //pieChart.getColor().setBackground(color(255, 100));
    pieChart.addDataSet("payment");
    //pieChart.setColors("payment", color(244, 89, 66));
    pieChart.setData("payment", dataSets);
    for(int i=0; i<dataSets.length; i++){
      pieChart.setColors("payment", color(25*i, 255, 255), color(255, i, 255));
      pieChart.unshift("payment", dataSets[i]);
    }
  }




}
