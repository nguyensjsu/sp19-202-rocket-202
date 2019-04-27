void setup(){
  size(380,680);
  display();
}

public void display() {
         
        background(250);
        int width = 380;
        int x_center = width/2;
        int y_begin = 0;
        int y_step = 50;
        int r = 30;
        
        int testSize = 13;
        
        //mid line
        stroke(220);
        line(x_center, 0, x_center, 600);
        
        /* month Header*/
        //mid cicrle
        noStroke(); 
        fill(135,206,247);
        circle(x_center, 60, 2*r);
        
        //mid month
        fill(255,250,250);
        textMode(MODEL);
        textSize(12);
        textAlign(CENTER,CENTER);
        text("2019-04", x_center, 60);
        
        //left & right text
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(CENTER,CENTER);
        text("Monthly Income", (x_center-r)/2, 50);
        text("207.00", (x_center-r)/2, 68);
        text("Monthly Expense", width - (x_center-r)/2, 50);
        text("107.00",  width -(x_center-r)/2, 68);
        
        /* day Header*/
        int r1 = 15;
        int x1 = 165;
        int x2 = 215;
        int y_step1 = r + y_step + r1;
        stroke(255,250,250);
        fill(220);
        circle(x_center, 60+y_step1, 2*r1);
        
        fill(41,36,33);
        textMode(MODEL);
        textSize(10);
        textAlign(CENTER,CENTER);
        text("1", x_center, 60+y_step1);
        
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(RIGHT,CENTER);
      //  text("daily", x1, 30+y_step);
        text("207.00 income", x1, 60+y_step1);
     //   text("207.00", x1-55, 40+y_step);
        textAlign(LEFT,CENTER);
      //  text("daily", x2, 30+y_step);
        text("expense 107.00", x2, 60+y_step1);
     //   text("107.00",  x2+60, 40+y_step);
        
        
        /* Flow Item*/
        PImage img;
        int r2 = 30;
        int y_step2 = y_step + r1 + r1;
        img = loadImage("/Users/yijunzhang/Documents/GitHub/sp19-202-rocket-202/src/img/entertainment.png");
        imageMode(CENTER);
        image(img, x_center, 60+2*y_step2, r2,r2);
        
        /* income */
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(RIGHT,CENTER);
        String name = "entertainment";
        float value = 0.00f;
        String income = value + " " + name;
        text(income, x1, 60+2*y_step2);
        
        /* expense */
         PImage img;
        int r2 = 30;
        int y_step2 = y_step + r1 + r1;
        img = loadImage("/Users/yijunzhang/Documents/GitHub/sp19-202-rocket-202/src/img/red_packet.png");
        imageMode(CENTER);
        image(img, x_center, 60+2*y_step2, r2,r2);
        
         fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(LEFT,CENTER);
        String name2 = "red_pocket";
        float value2 = 0.00f;
        String expense = name2 + " " + value2;
        text(expense, x2, 60+2*y_step2);
       
    }
