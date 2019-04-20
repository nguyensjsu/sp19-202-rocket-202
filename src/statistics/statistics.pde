import controlP5.*;
import java.util.*;

ControlP5 cp5;

void setup(){
  size(380, 680);
  cp5 = new ControlP5(this);
  
  // setup button name
  String[] items = new String[2];
  items[0] = "Categories";
  items[1] = "Trend";
  
  // setup button font size
  PFont font = createFont("arial",16);
  
  // setup Scollable List for Year and Month
  List yearList = Arrays.asList("2019","2018","2017","2016","2015","2014","2013","2012","2011","2010");
  List monthList = Arrays.asList("Jan.","Feb.","Mar.","Apr.","May","June","July","Aug.","Sep.","Oct.","Nov.","Dec.");
  List categories = Arrays.asList("Payment","Income");
  
  // create button
  ButtonBar button = cp5.addButtonBar("bar")
    .setPosition(0,0)
    .setSize(380,40)
    .setFont(font)
    .addItems(items);
   
  button.onMove(new CallbackListener(){
    public void controlEvent(CallbackEvent ev) {
      ButtonBar bar = (ButtonBar)ev.getController();
      println("hello ",bar.hover());
    }
  });
  
  // create a scollable list
  cp5.addScrollableList("Year")
    .setPosition(25,50)
    .setSize(70,100)
    .setBarHeight(40)
    .setItemHeight(30)
    .addItems(yearList)
    .setFont(font)
    .setType(ScrollableList.DROPDOWN)
    .setOpen(false)
    ;
  
  cp5.addScrollableList("Month")
    .setPosition(105,50)
    .setSize(100,100)
    .setBarHeight(40)
    .setItemHeight(30)
    .addItems(monthList)
    .setFont(font)
    .setType(ScrollableList.DROPDOWN)
    .setOpen(false)
    ;
    
  cp5.addScrollableList("Categories")
    .setPosition(215,50)
    .setSize(130,100)
    .setBarHeight(40)
    .setItemHeight(30)
    .addItems(categories)
    .setFont(font)
    .setType(ScrollableList.DROPDOWN)
    .setOpen(false)
    ;
 
}

void draw(){
  background(255,250,250);
}
