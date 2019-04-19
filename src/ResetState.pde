class ResetState extends PinSet{

	/**
	* display method
	*/ 
	public void display(){
		String str = "Enter New Passcode";
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
	}
	
	/**
	* set tempory passcode
	*/ 
	private void set(){
		screen.setTemp(code);
		reset();
	}
	
	/**
	* reset process
	*/ 
	private void reset(){
		code = "";
		screen.setState(screen.returnReenter());
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
