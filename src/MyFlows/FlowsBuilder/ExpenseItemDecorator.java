

public class ExpenseItemDecorator extends ItemDecorator
{
    FlowItem item;
    PImage icon;
    
    public ExpenseItemDecorator(FlowItem items){
        super(items);
        icon = loadImage(this.imgPath());
    }
    
    @Override
    public void display(){
       
    }
    
}
