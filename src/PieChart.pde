import controlP5.*;
import java.util.*;
import java.util.Date;
import java.text.*;

class PieChart extends Screen{
 ControlP5 cp5;
 ControlFont font;
 Chart pieChart;
 ShowList showList = new ShowList();
 //ArrayList<String> dataSet;
 float[] dataSets;
 String[] fieldSets;
 float[] dataSetFloat;
 float[] dataDegreeFloat;
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
 // String type; //<>//
  PImage  img;
  PImage imgb = loadImage("img/whiteback.png");
  int displacement = 0;
  int bottom = 640;
  int uplimit = 300;
  int end = -1;
 //<>//

 public PieChart(PApplet papplet,String name){
   cp5 = new ControlP5(papplet);
   // setup Tab font size
   PFont pfont = createFont("arial",16);
   font = new ControlFont(pfont);


   // setup Scollable List for Year and Month
   // List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");
   // List monthList = Arrays.asList("1","2","3","4","5","6","7","8","9","10","11","12");
   // List categories = Arrays.asList("Payment","Income");

   // // create pieChart scollable list
    // cp5.addScrollableList("pieChartYear")
     // .setPosition(55,50)
     // .setLabel("2019")
     // .setSize(70,100)
     // .setBarHeight(40)
     // .setItemHeight(30)
     // .addItems(yearList)
     // .setFont(font)
     // .setType(ScrollableList.DROPDOWN)
     // .setOpen(false)
     // ;

   // cp5.addScrollableList("pieChartMonth")
     // .setPosition(135,50)
     // .setSize(50,100)
     // .setLabel("4")
     // .setBarHeight(40)
     // .setItemHeight(30)
     // .addItems(monthList)
     // .setFont(font)
     // .setType(ScrollableList.DROPDOWN)
     // .setOpen(false)
     // ;

   // cp5.addScrollableList("payment")
     // .setPosition(195,50)
     // .setSize(130,100)
     // .setBarHeight(40)
     // .setItemHeight(30)
     // .addItems(categories)
     // .setFont(font)
     // .setType(ScrollableList.DROPDOWN)
     // .setOpen(false)
     // ;

   // Create my Pie Chart
   pieChart = createPieChart(name);
   // createPieChart(dataDegreeFloat);


 }

   public Chart createPieChart(String pieChartName){
     return cp5.addChart(pieChartName)
                        .setPosition(90,70)
                        .setSize(200,200)
                        .setView(Chart.PIE)
                        .setLabelVisible(true)
                        .setStrokeWeight(200)
                        .setColorCaptionLabel(color(40));
   }

   // public void createPieChart(float[] dataDegreeFloat){
   //   float lastAngle = 0;
   //   for (int i = 0; i < dataDegreeFloat.length; i++) {
   //     // float gray = map(i, 0, data.length, 0, 255);
   //     fill(getColor(fieldSets[i]));
   //     arc(width/2, height/2, 200, 200, lastAngle, lastAngle+radians(dataDegreeFloat[i]));
   //     lastAngle += radians(dataDegreeFloat[i]);
   //   }
   // }

   public void getDataSet( String path, boolean type){
      String outputPath = null;
      boolean categoriesTpe = true;
      outputPath = dataPath("")+path;
      ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",type));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getValueSet(outputPath, 2);
      fieldSets = contextCSVChart.getFieldSet(outputPath, 1);
      dataSetFloat = new float[dataSets.length];
      BigDecimal dataSum = BigDecimal.ZERO;

        for(int i=0; i<dataSets.length; i++){
            dataSum = dataSum.add(new BigDecimal(dataSets[i]));
        }
        for(int i=0; i<dataSets.length; i++){
            // get degrees data
            // dataDegreeFloat[i] = new BigDecimal(dataSets[i]).setScale(2, BigDecimal.ROUND_HALF_UP).divide(dataSum,2).multiply(new BigDecimal("360")).floatValue();
            // get percent
            dataSetFloat[i] = new BigDecimal(dataSets[i]).setScale(2, BigDecimal.ROUND_HALF_UP).divide(dataSum,2).floatValue();
        }
    }

	public void display(){
	image(imgb,0,0,380,290);
    image(img,0,0);
    fill(255);
    stroke(0,0,247);
    rectMode(CORNER);
    rect(20, 65, 80, 25, 10, 10, 10, 10);
    fill(0,0,247);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(df.format(new Date()), 60, 75);
 }

	public void hide(){
      pieChart.hide();
    }

    public void show(){
      pieChart.show();
    }

	public void drag(){
		displacement = displacement + mouseY - pmouseY;
		println("end: ",end);
	}

	protected void printData(String name){
		pieChart.addDataSet(name);
    pieChart.setData(name, dataSetFloat);
    for(int i=0; i<dataSetFloat.length; i++){
      pieChart.setColors(name, color(25*i, 255, 255), color(255, i, 255));
      // pieChart.setColors(name,getColor(fieldSets[i]));
    }
	if (displacement > 0) displacement = 0;
    end = showList.showBottomList(fieldSets, dataSetFloat, dataSets,displacement);

	}

	protected void setback(){
		if (end <= bottom-30 && !mousePressed) displacement *= 0.95;
	}

  public color getColor(String str){
    color c = color(0,0,0);
    switch(str){
      case "FOOD": c = color(247,199,133); break;
      case "CASH": c = color(190,119,118); break;
      case "ENTERTAINMENT": c = color(159,201,250); break;
      case "HEALTH": c = color(224,202,177); break;
      case "HOUSEHOLD": c = color(194,185,240); break;
      case "INSURANCE": c = color(181,201,163); break;
      case "OTHERS": c = color(150,219,250); break;
      case "RED_PACKET": c = color(241,138,143); break;
      case "REFUND": c = color(150,219,177); break;
      case "REWARDS": c = color(235,146,64); break;
      case "SALARY": c = color(110,129,186); break;
      case "SHOPPING": c = color(201,171,248); break;
      case "TRANSPORTATION": c = color(157,182,252); break;
    }
    return c;
  }


}
