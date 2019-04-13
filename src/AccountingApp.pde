KeyPad kp;
OutputText ot;
PImage keyPadImage;


void setup() {
  size(240, 480);
  kp = new KeyPad(0, 240, 240, 240);
  ot = new OutputText(120, 60, 120, 80);
  
  kp.attach(ot);
}

void draw() {
  background(255);
  fill(0);
  
  keyPadImage = loadImage("keypad.jpeg");
  image(keyPadImage, 0, 240, 240, 240);
  
  ot.showUp();
}

void mouseClicked() {
  kp.click(mouseX, mouseY);
}
