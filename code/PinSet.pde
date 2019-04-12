public class PinSet implements IDisplayComponent{
	IDisplayComponent next;
	IPinState current;
	public PinSet(){
		
	}
	
	public setNext(IDisplayComponent next){
		this.next = next;
	}
	
	public display(){
		String str = "Enter Passcode";
		textAlign(CENTER);
		textSize(26);
		fill(0);
		text(str, width/2, 100);
		
		next.display();
	}
}