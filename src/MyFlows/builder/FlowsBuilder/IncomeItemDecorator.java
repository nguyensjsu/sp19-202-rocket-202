

public class IncomeItemDecorator extends ItemDecorator
{
    FlowItemDisplay item;
    PImage icon;
    
    public IncomeItemDecorator(FlowItemDisplay items){
        super(items);
        icon = loadImage(this.imgPath());
    }
    
    @Override
    public void display(){
       
    }
    
}
