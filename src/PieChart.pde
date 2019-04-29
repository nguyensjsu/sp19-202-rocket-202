import controlP5.*;
import java.util.*;

class PieChart extends Screen{
 ControlP5 cp5;
 ControlFont font;
 Chart pieChart;
 ShowList showList = new ShowList();
 //ArrayList<String> dataSet;
 float[] dataSets;
 String[] fieldSets;
 float[] dataSetFloat;
 // String type;
  PImage  img;
  PImage imgb = loadImage("img/whiteback.png");
  int displacement = 0; //<>//
  int bottom = 640;
  int uplimit = 300;
  int end = -1;


 public PieChart(PApplet papplet,String name){
   // this.cp5 = cp5;    //<>//
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
            dataSetFloat[i] = new BigDecimal(dataSets[i]).setScale(2, BigDecimal.ROUND_HALF_UP).divide(dataSum,2).floatValue();
        }
    }
          
	public void display(){
	image(imgb,0,0,380,290);
    image(img,0,0);    
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
    }
	if (displacement > 0) displacement = 0;
    end = showList.showBottomList(fieldSets, dataSetFloat, dataSets,displacement);

	}
	
	protected void setback(){
		if (end <= bottom-30 && !mousePressed) displacement *= 0.95;
	}
}
