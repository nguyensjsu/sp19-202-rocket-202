import controlP5.*;
import java.util.*;

ChartScreen chartScreen;

void setup(){
  size(380, 680);
  chartScreen = new ChartScreen(this);
  }
  

  void draw(){
  chartScreen.display();
}

  void mouseClicked(){
    print("clicked");
    chartScreen.touch();
    }
