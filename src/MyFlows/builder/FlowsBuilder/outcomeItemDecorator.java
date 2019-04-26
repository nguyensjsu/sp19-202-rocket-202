

public class outcomeItemDecorator extends ItemDecorator
{
    FlowItemDisplay item;
    PImage icon;
    
    public outcomeItemDecorator(FlowItemDisplay items){
        super(items);
        icon = loadImage(this.imgPath());
    }
    
    @Override
    public void display(){
       
    }
    
}
