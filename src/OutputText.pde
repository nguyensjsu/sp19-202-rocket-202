class OutputText implements IKeyPadObserver {
  
  private int x1, y1, x2, y2;
  
  private String result = "";
  private String lastKey = "";
  
  public OutputText(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  
  public void showUp() {
    if(result == "")
      result = "0.00";
    
    textSize(32);
    textAlign(CENTER);
    text(result, x1, y1);
    
    textSize(10);
    textAlign(RIGHT);
    text(lastKey, x2, y2);
  }
  
  public void keyEventUpdate(String lastKey, String result) {
    this.lastKey = lastKey;
    this.result = result;
  }
  
}
