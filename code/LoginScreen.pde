public class LoginScreen implements IProxy{
	KeyPad kp;
	PinSet ps;
	IDisplayComponent chain;

    public LoginScreen(){
      kp = new KeyPad();
	  ps = new PinSet();
	  chain = ps;
	  ps.setNext(kp);
    }
    
    public void display(){
      chain.display();
    }
    
    public void touch(){
      chain.touch();
    }
	
}
