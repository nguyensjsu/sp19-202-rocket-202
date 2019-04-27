

public class OutcomeItemDecorator extends ItemDecorator
{
    FlowItem item;
    PImage icon;
    
    public OutcomeItemDecorator(FlowItem items){
        super(items);
        icon = loadImage(this.imgPath());
    }
    
    @Override
    public void display(){
       
    }
    
}
