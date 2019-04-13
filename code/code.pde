AppProxy proxy;

void setup(){
   size(400,700) ;
   proxy = new AppProxy();
}

void draw(){
  proxy.display();
  }
  
void mouseClicked(){
	proxy.touch();
}

void mouseDragged(){
	proxy.drag();
}

}
