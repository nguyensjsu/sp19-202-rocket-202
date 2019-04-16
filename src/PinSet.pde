/**
 * Pin set class for login process
 */ 
public abstract class PinSet implements IDisplayComponent, ITouchEventHandler{
	protected ITouchEventHandler next;
	protected LoginScreen screen;
	protected String code;
	protected boolean wrongFlag;
	
	public PinSet(){	
		wrongFlag = false;
		code = "";
	}
	
	/**
	* Set next component of display chain
	*/ 
	public void setNext(ITouchEventHandler next){
		this.next = next;
	}
	
	/**
	* Display content
	*/ 
	public void display(){

	}
	
	/**
	* Display for passcode block
	*/ 
	public void block(int num){
		int distance = 10;
		int positionY = 200;
		int h = 40;
		int w = 30;
		int[] ind = {-3, -1, 1, 3};
		int j = 0;
		for (int i : ind){
			rectMode(RADIUS);
			fill(255);
			rect(width/2 + i*(distance+w), positionY, w, h);
			//println(i,"  ", width/2 + i*distance);
			if(j < num){
				String str = "*";
				textAlign(CENTER);
				textSize(26);
				fill(0);
				text(str, width/2 + i*(distance+w), positionY);
				j++;
			}
		}		
	}
	
	/**
	* Set client
	*/ 
	public void setClient(LoginScreen screen){
		this.screen = screen;
	}
	
	/**
	* touch method
	*/ 
	public void touch(){
		next.touch();
	}
	
	/**
	* retrieve code update
	*/ 
	public void update(String str){
		if(str.compareTo("0")>=0 && str.compareTo("9")<=0) this.code = this.code + str;
		else if (str.equalsIgnoreCase("x") && !this.code.isEmpty()) this.code = this.code.substring(0,this.code.length()-1);
	}
	
	/**
	* show error message
	*/ 
	private void showError(){
	
	}
	
	/**
	* cancel command
	*/ 
	private void cancel(){
		
	}
}
