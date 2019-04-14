KeyPad kp;
OutputText ot;
PImage keyPadImage;


void setup() {
  size(380, 680);
  kp = new KeyPad(0, 420, 380, 260);
  ot = new OutputText(190, 100, 250, 150);
  
  kp.attach(ot);
}

void draw() {
  background(255);
  fill(0);
  
  keyPadImage = loadImage("keypad.jpeg");
  image(keyPadImage, 0, 420, 380, 260);
  
  ot.showUp();
}

void mouseClicked() {
  kp.click(mouseX, mouseY);
}
