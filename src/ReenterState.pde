class ReenterState extends PinSet{

	/**
	* display method
	*/ 
	public void display(){
		String str = "Enter New Passcode Again";
		textAlign(CENTER);
		textSize(26);
		fill(0);
		text(str, width/2, 100);
		String btm = "Cancel";
		textAlign(CENTER);
		textSize(26);
		fill(0);
		text(btm, width/2, 650);
		block(code.length());
		if(wrongFlag) showError();
		super.display();
	}
	
	/**
	* touch method
	*/ 
	public void touch(){
		wrongFlag = false;
		if(mouseX<width/2+50 && mouseX>width/2-50 && mouseY < 700 && mouseY > 600) this.cancel();
		super.touch();
	}
	
	/**
	* show error message
	*/ 
	private void showError(){
		String str = "Different New Passcode";
		textAlign(CENTER);
		textSize(20);
		fill(255,0,0);
		text(str, width/2, 140);	
	}
	
	/**
	* verify tempory passcode
	*/ 
	private void set(){
		if(!screen.checkTemp(code)){
			code = "";
			screen.addShock();
			wrongFlag = true;
		}
		else reset();
	}
	
	/**
	* reset procass 
	*/ 
	private void reset(){
		code = "";
		screen.setState(screen.returnLogin());
	}
	
	/**
	* cancel reset
	*/ 
	private void cancel(){
		code = "";
		screen.setState(screen.returnLogin());
	}
	
	/**
	* update code
	*/ 
	public void update(String str){
		super.update(str);
		if(code.length() == 4) set();	
	}
}
