import controlP5.*;
import java.util.*;
import java.util.Date;
import java.text.*;

class PieChart extends Screen implements IChartStrategy{
 ControlP5 cp5;
 ControlFont font;
 // Chart pieChart;
 ShowList showList = new ShowList();
 //ArrayList<String> dataSet;
 float[] dataSets;
 String[] fieldSets;
 float[] dataSetFloat;
 float[] dataDegreeFloat;
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
 boolean type;
 String categories;
  PImage  img;
  PImage imgb = loadImage("img/whiteback.png");
  int displacement = 0;
  int bottom = 640;
  int uplimit = 300;
  int end = -1;

 public PieChart(String categories){

   this.categories = categories;
   if(categories.equals("EXPENSE")){
     img = loadImage("img/chart_expense.png");
   } else if(categories.equals("INCOME")){
     img = loadImage("img/chart_income.png");
   }


   // Create my Pie Chart



 }

   // public Chart createPieChart(String pieChartName){
   //   return cp5.addChart(pieChartName)
   //                      .setPosition(90,70)
   //                      .setSize(200,200)
   //                      .setView(Chart.PIE)
   //                      .setLabelVisible(true)
   //                      .setStrokeWeight(200)
   //                      .setColorCaptionLabel(color(40));
   // }

   public void createPieChart(float[] dataDegreeFloat){
     float lastAngle = 0;
     for (int i = 0; i < dataDegreeFloat.length; i++) {
       // float gray = map(i, 0, data.length, 0, 255);
       fill(getColor(fieldSets[i]));
       arc(190, 190, 200, 200, lastAngle, lastAngle+radians(dataDegreeFloat[i]));
       lastAngle += radians(dataDegreeFloat[i]);
     }
   }

   public void getDataSet(){
      String outputPath = null;
      boolean categoriesTpe = true;
      // Get data first
      if(categories.equals("EXPENSE")){
        outputPath = dataPath("")+"/PieChartForExpense.csv";
        type = true;
      } else if(categories.equals("INCOME")){
        outputPath = dataPath("")+"/PieChartForExpense.csv";
        type = false;
      }
      ContextCSVChart contextCSVChart = new ContextCSVChart(new PieChartCSV("2019-04",type));
      contextCSVChart.excuteCSVStrategy(outputPath);
      dataSets = contextCSVChart.getValueSet(outputPath, 2);
      fieldSets = contextCSVChart.getFieldSet(outputPath, 1);
      dataSetFloat = new float[dataSets.length];
      dataDegreeFloat = new float[dataSets.length];
      BigDecimal dataSum = BigDecimal.ZERO;

        for(int i=0; i<dataSets.length; i++){
            dataSum = dataSum.add(new BigDecimal(dataSets[i]));
        }
        for(int i=0; i<dataSets.length; i++){
            // get degrees data
            dataDegreeFloat[i] = new BigDecimal(dataSets[i]).multiply(new BigDecimal("360")).setScale(2, BigDecimal.ROUND_HALF_UP).divide(dataSum,2).floatValue();
            System.out.println(fieldSets[i]);
            System.out.println(dataDegreeFloat[i]);
            // get percent
            dataSetFloat[i] = new BigDecimal(dataSets[i]).setScale(2, BigDecimal.ROUND_HALF_UP).divide(dataSum,2).floatValue();
        }
    }

	public void display(){
    image(imgb,0,0,380,680);
    getDataSet();
    printData();
    image(imgb,0,0,380,300);
    image(img,0,0);
    fill(255);
    stroke(0,0,247);
    rectMode(CORNER);
    rect(20, 65, 80, 25, 10, 10, 10, 10);
    fill(0,0,247);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(df.format(new Date()), 60, 75);
  	setback();
    noStroke();
    createPieChart(dataDegreeFloat);
 }

	// public void hide(){
  //     pieChart.hide();
  //   }
  //
  //   public void show(){
  //     pieChart.show();
  //   }

	public void drag(){
		displacement = displacement + mouseY - pmouseY;
		println("end: ",end);
	}

	protected void printData(){
		// pieChart.addDataSet(name);
    // pieChart.setData(name, dataSetFloat);
    // for(int i=0; i<dataSetFloat.length; i++){
    //
    //   pieChart.setColors(name, color(25*i, 255, 255), color(255, i, 255));
    //         // fill(getColor(fieldSets[i]));
    //   // pieChart.setColors(i,getColor(fieldSets[i]));
    // }
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
