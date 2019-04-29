interface IKeyPadSubject {
  
  void attach(IKeyPadObserver observer);
  
  void remove(IKeyPadObserver observer);
  
  void notifyObservers();
  
}
