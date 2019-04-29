

public class FlowItem implements IFlowItem, IDisplayComponent, ITouchEventHandler
{
    private String[] flowDetail;
    private String icopath;
    private ITouchEventHandler nextHandler;
    private String name = " ";
    private float f = 0.0f;
    
    public FlowItem(String detail){
        flowDetail = detail.split(",");
      /*  System.err.println("FlowItemInput: "+ detail);
        System.err.println("FlowItemContent: "+ flowDetail);
        System.err.println("FlowItemName: "+ typeName());
        System.err.println("FlowItemValue: "+ value());
        System.err.println("FlowItemimgpath: "+ imgPath()); */
    }
    
    public String typeName(){
        if(flowDetail[1] != null){
            name = flowDetail[1];
        }
        return name;
    };
    
    public String imgPath(){
        return "img/" + typeName().toLowerCase() +".png";
    };
    
    public float value(){
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
