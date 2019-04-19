AppProxy proxy;

void setup(){
   size(400,700) ;
   proxy = new AppProxy();
}

void draw(){
  background(240);
  proxy.display();
  }
  
void mouseClicked(){
  println("clicked: ", mouseX, "  ", mouseY);
	proxy.touch();
}

void mouseDragged(){
	proxy.drag();
}
