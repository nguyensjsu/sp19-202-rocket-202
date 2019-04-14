/**
 * Pin set class for login process
 */ 
public class PinSet implements IDisplayComponent{
	IDisplayComponent next;
	//?
	IPinState current;
	public PinSet(){
		
	}
	
	/**
	* Set next component of display chain
	*/ 
	public void setNext(IDisplayComponent next){
		this.next = next;
	}
	
	/**
	* Display content
	*/ 
	public void display(){
		String str = "Enter Passcode";
		textAlign(CENTER);
		textSize(26);
		fill(0);
		text(str, width/2, 100);
		block();
		next.display();
	}
	
	/**
	* Display for passcode block
	*/ 
	private void block(){
		int distance = 10;
		int positionY = 160;
		int h = 40;
		int w = 30;
		int[] ind = {-3, -1, 1, 3};
		for (int i : ind){
			rectMode(RADIUS);
			rect(width/2 + i*(distance+w), positionY, w, h);
			println(i,"  ", width/2 + i*distance);
		}
		
	}
}