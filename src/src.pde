AppProxy proxy;


void setup(){
   size(380, 680);
   proxy = new AppProxy(this);
   img = loadImage("img/logo.jpg");
   flag = true;
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
  println("dragged: ", mouseX, "  ", mouseY);
	proxy.drag();
}
