class OutputText implements IKeyPadObserver, ITouchEventHandler, IDisplayComponent {

  private int x1, y1, x2, y2;

  private String result = "";
  private String lastKey = "";
  private ITouchEventHandler nextHandler;

  public OutputText(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  public void display() {
    fill(50);
    if(result == "")
      result = "0.00";

    textSize(32);
    textAlign(RIGHT);
    text(result, x1, y1);
  }


  void touch(){
      if (nextHandler != null) {
          nextHandler.touch();
      }
  };

   /**
  * set next touch event handler
  */
   void setNext(ITouchEventHandler next){
      nextHandler = next;
   };
  public void addSubComponent(IDisplayComponent c) {}

  public void keyEventUpdate(String lastKey, String result) {
    this.lastKey = lastKey;
    this.result = result;
  }

  public String getText() {
    return result;
  }

}
