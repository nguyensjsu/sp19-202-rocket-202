AppProxy proxy;
final long startTime = System.currentTimeMillis();
PImage img;
boolean flag;

void setup(){
   size(380, 680);
   proxy = new AppProxy(this);
   img = loadImage("img/logo.jpg");
   flag = true;
}

void draw(){
  //background(240);
	if(System.currentTimeMillis() - startTime > 3000){
		flag = false;
	}
	if(flag){
    background(255);
    image(img,70,450,100,100);
    textAlign(LEFT,CENTER);
	fill(0);
	textSize(25);
	text("POKE\nACCOUNTING",180,500);
	fill(200);
	stroke(200);
	rectMode(CENTER);
	rect(340,40,60,30);
	fill(255);
	textSize(15);
	int time = 3-(int)(System.currentTimeMillis() - startTime)/1000;
	textAlign(CENTER,CENTER);
	text("skip("+time+"s)",340,38);
  }else{
    proxy.display();
  }
}

void mouseClicked(){
  println("clicked: ", mouseX, "  ", mouseY);
  if(flag){
	if(mouseX<340+40 && mouseX>340-40 && mouseY < 40+20 && mouseY > 40-20)  flag = false;
  }else{
	proxy.touch();
  }
}

void mouseDragged(){
  println("dragged: ", mouseX, "  ", mouseY);
	proxy.drag();
}
