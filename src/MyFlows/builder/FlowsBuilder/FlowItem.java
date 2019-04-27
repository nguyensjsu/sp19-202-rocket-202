

public class FlowItem implements IFlowItem, IDisplayComponent, ITouchEventHandler
{
    String[] flowDetail;
    String icopath;
    private ITouchEventHandler nextHandler;
    
    public FlowItem(String detail){
        flowDetail = detail.split(",");
    }
    
    public String typeName(){
        return flowDetail[1];
    };
    
    public String imgPath(){
        return "img/" + typeName() +".png";
    };
    
    public float value(){
        return flowDetail[2];
    };
    
    public boolean outcome(){
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
