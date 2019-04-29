
/**
 * central vertical line between each displayed flow item
 */
public class SpaceLine implements IDisplayComponent,ITouchEventHandler
{
   private ITouchEventHandler nextHandler;
   
   public void touch(){
        //pass touch inside items
        if (nextHandler != null){
           nextHandler.touch(); 
        }
    };

    public void setNext(ITouchEventHandler next){
       nextHandler = next;
    };
   
    public void display(){
        stroke(220);
        line(190, 0, 190, 600);
    };

    public void addSubComponent(IDisplayComponent c){};
}
