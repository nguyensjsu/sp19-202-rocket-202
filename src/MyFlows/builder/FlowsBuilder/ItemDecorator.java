import java.math.BigDecimal;

public class ItemDecorator implements IFlowItem, IDisplayComponent, ITouchEventHandler
{
    FlowItemDisplay item;
    
    public ItemDecorator(FlowItemDisplay items){
        item = items;
    }
    
    public String typeName(){
        return item.typeName();
    };
    
    public String imgPath(){
        return item.imgPath();
    };
    
    public BigDecimal value(){
        return item.value();
    };
    
    public void touch(){
        item.touch();
    };

    public void setNext(ITouchEventHandler next){
        item.setNext(next);
    };
   
    public void display(){
        item.display();
    };

    public void addSubComponent(IDisplayComponent c){
        item.addSubComponent(c);
    };
    
}
