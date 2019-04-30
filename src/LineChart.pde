import controlP5.*;
import java.util.*;
// import org.gicentre.utils.stat.*;

class LineChart extends Screen implements IChartStrategy{
  ControlP5 cp5;
  ControlFont font;
  PImage img, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec;
  float[] yPayment;
  float[] yIncome;
  float[] yBalance;
  String[] monthSets;
  // String month;
  SimpleDateFormat df = new SimpleDateFormat("yyyy");
  int count=0;
  LineChartPlot lp = new LineChartPlot(width/2, 90);

  PImage imgb = loadImage("img/whiteback.png");
  int displacement = 0;
  int bottom = 640;
  int uplimit = 380;
  int height = 380;
  int end = -1;

  public LineChart(){
    img = loadImage("img/chart_monthly.png");
    jan = loadImage("img/jan.png");
    feb = loadImage("img/feb.png");
    mar = loadImage("img/mar.png");
    apr = loadImage("img/apr.png");
    may = loadImage("img/may.png");
    jun = loadImage("img/jun.png");
    jul = loadImage("img/jul.png");
    aug = loadImage("img/aug.png");
    sep = loadImage("img/sep.png");
    oct = loadImage("img/oct.png");
    nov = loadImage("img/nov.png");
    dec = loadImage("img/dec.png");

    // setup Tab font size
    PFont pfont = createFont("arial",16);
    font = new ControlFont(pfont);
  }

public void showBottomList(){
        count = 0;
		if (displacement > 0) displacement = 0;
    int h = height + displacement;
    stroke(0);
	  line(0,h,380,h);
    h = h+15;
    textSize(15);
    textAlign(LEFT, CENTER);
    fill(0,0,0);
    text("Month",10,h);
    textAlign(CENTER, CENTER);
    text("Income",120,h);
    textAlign(CENTER, CENTER);
    text("Expense",220,h);
    textAlign(CENTER, CENTER);
    text("Balance",320,h);
        // singleList(height+displacement, "Month","Income", "Expense","Balance");
      for(int i=0; i< 12; i++){
        if(yPayment[i]!=0 || yIncome[i]!=0 || yBalance[i]!=0){
          count = count+1;
          // month = month(i+1);
          singleList(height+20*count+15*count+displacement, month(i+1), String.valueOf(yIncome[i]),String.valueOf(yPayment[i]),String.valueOf(yBalance[i]));
			    end = height+20*count+15*count+displacement;
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
	  for(int i = 0; i< yPayment.length;i++){
		  yPayment[i] = -yPayment[i];
	  }
    }

  void display(){
    background(255);
	  getDataSet();
	  showBottomList();
	  image(imgb,0,0,380,height);
    image(img,0,0);

    fill(255);
    stroke(0,0,247);
    rectMode(CORNER);
    rect(45, 55, 60, 25, 10, 10, 10, 10);
    fill(0,0,247);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(df.format(new Date()), 75, 65);
    textSize(9);

	lp.getMax(yIncome);
	lp.getMax(yPayment);
	lp.getMax(yBalance);
	lp.printAxis();

  lp.getData(yPayment, color(100,149,237),"Payment", true);
  lp.getData(yIncome, color(127,255,212),"Income", true);
  lp.getData(yBalance, color(240,128,128),"Balance",false);


    setback();

  }

  public PImage month(int m){
    PImage returnImg = null;
    switch(m){
      case 1: returnImg = jan; break;
      case 2: returnImg = feb; break;
      case 3: returnImg = mar; break;
      case 4: returnImg = apr; break;
      case 5: returnImg = may; break;
      case 6: returnImg = jun; break;
      case 7: returnImg = jul; break;
      case 8: returnImg = aug; break;
      case 9: returnImg = sep; break;
      case 10: returnImg = oct; break;
      case 11: returnImg = nov; break;
      case 12: returnImg = dec; break;
    }
    return returnImg;
  }

  public void singleList(float h,PImage icon, String s2, String s3, String s4){
    stroke(0);
	  line(0,h,380,h);
    h = h+15;
    image(icon,10,h-12,30,30);
    textSize(15);
    // textAlign(LEFT, CENTER);
    fill(0,0,0);
    // text(s1,10,h);
    textAlign(CENTER, CENTER);
    text(s2,120,h);
    textAlign(CENTER, CENTER);
    text(s3,220,h);
    textAlign(CENTER, CENTER);
    text(s4,320,h);
  }

	public void drag(){
		displacement = displacement + mouseY - pmouseY;
		println("end: ",end);
	}

	protected void setback(){
		if (end <= bottom-30 && !mousePressed) displacement *= 0.95;
	}
}
