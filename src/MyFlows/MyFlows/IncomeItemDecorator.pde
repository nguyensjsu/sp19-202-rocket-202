import java.math.BigDecimal;

public class IncomeItemDecorator extends ItemDecorator
{
    FlowItem item;
    PImage icon;
    private int r = 30;
    private int width = 380;
    private int x_center = width/2;
    private int y;
    int testSize = 13;
    int x_left = 165;
    
    public IncomeItemDecorator(FlowItem items){
        super(items);
        icon = loadImage(this.imgPath());
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
        BigDecimal value = new BigDecimal(item.value());
        String income = value + " " + item.typeName();
        
        fill(41,36,33);  //color for text
        textSize(testSize);
        textAlign(RIGHT,CENTER);
        text(income, x_left, y);
    };
    
    public void setY(int y_before){
        y = y_before + 70;
    }
    
    public int getY(){
       return y;
    }
}
