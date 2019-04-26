import controlP5.*;
import java.util.*;

class PieChartIncome implements IChartStrategy{
  ControlP5 cp5;
  ControlFont font;
  Chart pieChart;
  ShowList showList = new ShowList();
  //ArrayList<String> dataSet;
  float[] dataSets;
  String[] fieldSets;
  float[] dataSetFloat;
  PImage img;

  public PieChartIncome(PApplet papplet,ControlP5 cp5){
    this.cp5 = cp5;  //<>//
    
        // setup Tab font size
    PFont pfont = createFont("arial",16);
    font = new ControlFont(pfont);
    
    img = loadImage("img/chart_income.png");
    // setup Scollable List for Year and Month
    List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");
    List monthList = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
    List categories = Arrays.asList("Payment","Income");
    
    // create pieChart scollable list
     cp5.addScrollableList("pieChartIncomeYear")
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

    cp5.addScrollableList("pieChartIncomeMonth")
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


    // Create my Pie Chart
    pieChart = createPieChart("Income Pie Chart");
    
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
    
    public void hide(){
      pieChart.hide();
    }
    
    public void getDataSet(){
      String outputPath = null;
      boolean categoriesTpe = true;
      outputPath = dataPath("")+"/PieChartForIncome.csv";
      
      ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",false));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getDataSet(outputPath);
      fieldSets = contextCSVChart.getFieldSet(outputPath);
      dataSetFloat = new float[dataSets.length];
      BigDecimal dataSum = BigDecimal.ZERO;
        
        for(int i=0; i<dataSets.length; i++){
            dataSum = dataSum.add(new BigDecimal(dataSets[i]));
        }
        for(int i=0; i<dataSets.length; i++){
            dataSetFloat[i] = new BigDecimal(dataSets[i]).divide(dataSum,2).floatValue();
            //System.out.println(dataSetFloat[i]*100);
        }
    }
    
    public void showBottomList(){
      //showList.singleList(400, "Test", "Test", "Test");
      for(int i=0; i< fieldSets.length; i++){
        showList.singleList(400+30*i+20*i, fieldSets[i],  String.valueOf(dataSetFloat[i]*100).substring(0,4)+"%", String.valueOf(dataSets[i]));
      }
      
    }

  void display(){
    background(255,255,255); 
    image(img,0,0);
    // set data for pie chart
    getDataSet();
    //pieChart.getColor().setBackground(color(255, 100));
    pieChart.addDataSet("payment");
    //pieChart.setColors("payment", color(244, 89, 66));
    pieChart.setData("payment", dataSetFloat);
    for(int i=0; i<dataSetFloat.length; i++){
      pieChart.setColors("payment", color(25*i, 255, 255), color(255, i, 255));
    }
    showBottomList();
    
  }




}
