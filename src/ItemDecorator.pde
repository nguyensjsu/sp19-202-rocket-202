

public class ItemDecorator implements IFlowItem, IDisplayComponent, ITouchEventHandler
{
    private FlowItem item;
    
    public ItemDecorator(FlowItem items){
        item = items;
    }
    
    public String typeName(){
        return item.typeName();
    };
    
    public String imgPath(){
        return item.imgPath();
    };
    
    public float value(){
        return item.value();
    };
    
    public boolean expense(){
        return item.expense();
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

     public void setY(int y_before){
        item.setY(y_before);
    }
    
    public int getY(){
       return item.getY();
    }
    
    
}
