interface IClickEventHandler {
  
  void click(int x, int y);
  
  void setNext(IClickEventHandler next);
  
}
