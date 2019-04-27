

public class FlowItem implements IFlowItem, IDisplayComponent, ITouchEventHandler
{
    private String[] flowDetail;
    private String icopath;
    private ITouchEventHandler nextHandler;
    
    public FlowItem(String detail){
        flowDetail = detail.split(",");
    }
    
    public String typeName(){
        return flowDetail[1];
    };
    
    public String imgPath(){
        return "img/" + typeName().toLowerCase() +".png";
    };
    
    public float value(){
        float f = 0.00f;
        try 
        {
            f = Float.valueOf(flowDetail[2].trim()).floatValue();
           // return f;
        }
        catch (NumberFormatException nfe) 
        {
            System.err.println("NumberFormatException: " + nfe.getMessage());
        }
        return f;
    };
    
    public boolean expense(){
        if (flowDetail[0].equals("TRUE")){
            return true ;
        } else{
            return false;
        }
    };
    
    public void touch(){
        //trigger delete cvs item; 
        if (nextHandler != null){
           nextHandler.touch(); 
        }
    };

    public void setNext(ITouchEventHandler next){
       nextHandler = next;
    };
   
    public void display(){};

    public void addSubComponent(IDisplayComponent c){};
    
    
}
