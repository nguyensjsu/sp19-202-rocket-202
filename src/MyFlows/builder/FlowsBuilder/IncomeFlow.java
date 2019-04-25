

public class IncomeFlow extends FlowItem
{
    FlowItem item;
    
    IncomeFlow(FlowItem items){
        this.item = items;
    }
    
    public void display(){
        String display;
        display = this.value() + this.typeName();
    }
    
    public String typeName(){
        return item.typeName();
    };
    
    public float value(){
        return item.value();
    };
    
    public 
}
