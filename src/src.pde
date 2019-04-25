/*
AppController app;
void setup() {
    size(380, 680);
    app = new AppController();
}

void draw(){
    background(255);
    app.display();
}

void mouseClicked(){
    println("clicked: ", mouseX, "  ", mouseY);
    app.touch();
}

void mouseDragged(){
    app.drag();
}
*/


AppProxy proxy;


void setup(){
   size(380, 680);
   proxy = new AppProxy();
}

void draw(){
  //background(240);
  proxy.display();
}

void mouseClicked(){
  println("clicked: ", mouseX, "  ", mouseY);
	proxy.touch();
}

void mouseDragged(){
	proxy.drag();
}
