
/**
 * Build the flows contain each recorded day
 */
public class FlowBuilder implements IFlowSubject
{
    private IFlowObserver ob;
    private String incomeTol;
    private String outcomeTol;
    
    public void attach(IFlowObserver observer){
        ob = observer;
    };
  
    public void notifyObservers(){
        ob.flowSumUpdate(false, incomeTol);
        ob.flowSumUpdate(true, outcomeTol);
    };
}
