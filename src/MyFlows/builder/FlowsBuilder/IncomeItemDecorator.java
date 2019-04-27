

public class IncomeItemDecorator extends ItemDecorator
{
    FlowItem item;
    PImage icon;
    
    public IncomeItemDecorator(FlowItem items){
        super(items);
        icon = loadImage(this.imgPath());
    }
    
    @Override
    public void display(){
       
    }
    
}
