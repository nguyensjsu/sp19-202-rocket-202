AppProxy proxy;


void setup(){
   size(380, 680);
   proxy = new AppProxy(this);
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
