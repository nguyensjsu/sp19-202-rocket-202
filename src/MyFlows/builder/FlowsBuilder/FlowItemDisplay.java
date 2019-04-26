import java.math.BigDecimal;

public class FlowItemDisplay implements IFlowItem, IDisplayComponent, ITouchEventHandler
{
    String[] flowDetail;
    String icopath;
    private ITouchEventHandler nextHandler;
    
    public FlowItemDisplay(String detail){
        flowDetail = detail.split(",");
    }
    
    public String typeName(){
        return flowDetail[0];
    };
    
    public String imgPath(){
        return "img/" + typeName() +".png";
    };
    
    public BigDecimal value(){
        return new BigDecimal(flowDetail[1]);
    };
    
    public void touch(){
       //trigger delete cvs item; 
    };

    public void setNext(ITouchEventHandler next){
       nextHandler = next;
    };
   
    public void display(){};

    public void addSubComponent(IDisplayComponent c){};
}
