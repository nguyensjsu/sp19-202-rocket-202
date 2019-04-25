import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Stack;

class KeyPad implements ITouchEventHandler, IKeyPadSubject, IDisplayComponent {

  private ITouchEventHandler nextHandler;
  private double keyWidth, keyHeight;
  private int x, y, w, h;
  private ArrayList<IKeyPadObserver> observers;

  private int rowNum = 4;
  private int colNum = 4;
  private int decimalDigits = 0;
  private boolean dotClicked = false;
  private String lastKey = "";
  private String lastSignal = "+";
  private String numberStr1 = "";
  private String numberStr2 = "";
  private PImage img;

  public KeyPad(int x, int y, int w, int h) {
    observers = new ArrayList<IKeyPadObserver>();
    img = loadImage("img/keypad.jpeg");

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    keyWidth = (double) w / colNum;
    keyHeight = (double) h / rowNum;
  }

  public void display() {
    image(img, x, y, w, h);
  }

  public void addSubComponent(IDisplayComponent c){}

  public void touch() {
    int x = mouseX;
    int y = mouseY;
    //System.out.println("KeyPad Touch: " + x + "," + y);
    // TODO: Remove it if checking valid click is not needed

    if(!isValidClick(x, y)) {
      if(nextHandler != null)
        nextHandler.touch();
      return;
    }
    System.out.println("KeyPad Touch: " + x + "," + y);

    this.lastKey = getKey(x, y);
    System.out.println(lastKey);
    notifyObservers();

    // TODO: Reset if lastKey is "S"
  }

  public void setNext(ITouchEventHandler next) {
    nextHandler = next;
  }

  private boolean isValidClick(int x, int y) {
    return (x >= this.x && x <= this.x + w &&
            y >= this.y && y <= this.y + h);
  }

  private String getKey(int x, int y) {
    int kx = (int) (x / keyWidth);
    int ky = (int) ((y - this.y) / keyHeight);

    String res = "";
    if(isDelete(kx, ky)) {
      res = "X";
    }
    if(isPlus(kx, ky)) {
      res = "+";
    }
    if(isMinus(kx, ky)) {
      res = "-";
    }
    if(isSubmit(kx, ky)) {
      res = "S";
    }
    if(isClean(kx, ky)) {
      res = "C";
    }
    if(isZero(kx, ky)) {
      res = "0";
    }
    if(isDot(kx, ky)) {
      res = ".";
    }
    if(isOToN(kx, ky)) {
      res = Integer.toString((kx + 1) + ky * 3);
    }

    keyAction(res);

    return res;
  }

  private boolean isDelete(int x, int y) {
    return (x == 3 && y == 0);
  }

  private boolean isPlus(int x, int y) {
    return (x == 3 && y == 1);
  }

  private boolean isMinus(int x, int y) {
    return (x == 3 && y == 2);
  }

  private boolean isSubmit(int x, int y) {
    return (x == 3 && y == 3);
  }

  private boolean isClean(int x, int y) {
    return (x == 0 && y == 3);
  }

  private boolean isZero(int x, int y) {
    return (x == 1 && y == 3);
  }

  private boolean isDot(int x, int y) {
    return (x == 2 && y == 3);
  }

  private boolean isOToN(int x, int y) {
    return (x >= 0 && x <= 2 &&
            y >= 0 && y <= 2);
  }

  public void attach(IKeyPadObserver observer) {
    observers.add(observer);
  }

  public void remove(IKeyPadObserver observer) {
    int i = observers.indexOf(observer);
    if(i >= 0)
      observers.remove(i) ;
  }

  public void notifyObservers() {
    for (int i = 0; i < observers.size(); i++) {
      String result = cal();

      IKeyPadObserver observer = observers.get(i);
      observer.keyEventUpdate(lastKey, result) ;
    }
  }

  private void keyAction(String k) {
    if(k == "X") {
      // TODO: Delete numberStr1 if numberStr2 is empty
      if(numberStr2.length() > 1) {
        numberStr2 = numberStr2.substring(0, numberStr2.length() - 1);

        if(numberStr2.substring(numberStr2.length() - 1) == ".") {
          dotClicked = false;
        }
      } else {
        numberStr2 = "";
      }
    }
    if(k == "." && dotClicked == false) {
      if(numberStr2.length() == 0)
        numberStr2 += "0";

      numberStr2 += k;
      dotClicked = true;
    }
    if(k == "+" || k == "-") {
      numberStr1 = cal();
      lastSignal = k;

      numberStr2 = "";
      dotClicked = false;
      decimalDigits = 0;
    }
    if(k == "C") {
      numberStr1 = "";
      numberStr2 = "";
      dotClicked = false;
      decimalDigits = 0;
      lastSignal = "+";
    }
    if(k.matches("^[0-9]")) {
      if(dotClicked == true && decimalDigits == 2)
        return;

      numberStr2 += k;
      if(dotClicked == true)
        decimalDigits++;
    }
  }

  private String cal() {
    if(numberStr2 == "")
      return numberStr1;

    double num1 = 0.00;
    if(numberStr1 != "") {
      num1 = Double.parseDouble(numberStr1);
    }

    double num2 = 0.00;
    if(numberStr2.substring(numberStr2.length() - 1) == ".")
      num2 = Double.parseDouble(numberStr2.substring(0, numberStr2.length() - 1));
    else
      num2 = Double.parseDouble(numberStr2);

    String res = "";
    DecimalFormat df = new DecimalFormat("0.00");
    if(lastSignal == "+") {
      res =  df.format(num1 + num2);
    }
    if(lastSignal == "-") {
      res = df.format(num1 - num2);
    }

    return res;
  }

  /**
   * reset keypad to initial status.
   */
  public void reset() {
    lastKey = "";
    numberStr1 = "";
    numberStr2 = "";
    dotClicked = false;
    decimalDigits = 0;
    lastSignal = "+";
    notifyObservers();
  }

}
