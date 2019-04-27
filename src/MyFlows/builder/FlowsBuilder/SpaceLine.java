
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
   
    public void display(){};

    public void addSubComponent(IDisplayComponent c){};
}
