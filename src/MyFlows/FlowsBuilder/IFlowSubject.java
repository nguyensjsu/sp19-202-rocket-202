
/**
 * subject of the flows items
 */
public interface IFlowSubject
{
    void attach(IFlowObserver observer);
  
    void notifyObservers();
}
