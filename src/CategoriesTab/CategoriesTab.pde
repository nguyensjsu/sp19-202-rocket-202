import controlP5.*;
import java.util.*;

ControlP5 cp5;
ControlFont font;

void setup(){
  size(380, 680);
  cp5 = new ControlP5(this);
  
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
 
}

void draw(){
  background(255,250,250);
}
