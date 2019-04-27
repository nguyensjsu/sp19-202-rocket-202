import java.text.*;

public class ExpenseItemDecorator extends ItemDecorator
{
    private FlowItem item;
    private PImage icon;
    private int r = 30;
    private int width = 380;
    private int x_center = width/2;
    private int y;
    private int testSize = 13;
    private int x_right = 215;
    private DecimalFormat df;
    
    public ExpenseItemDecorator(FlowItem items){
        super(items);
        icon = loadImage(this.imgPath());
        df = new DecimalFormat("0.00");
    }
    
    @Override
    public void display(){
       circleDraw();
       textDraw();
    }
    
    public void circleDraw(){
        imageMode(CENTER);
        image(icon,x_center,y,r,r);
    };
    
    public void textDraw(){
        String expense = item.typeName() + " " + df.format(item.value());
        
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(LEFT,CENTER);
        text(expense, x_right, y);
    };
    
    public void setY(int y_before){
        y = y_before + 70;
    }
    
    public int getY(){
       return y;
    }
}
