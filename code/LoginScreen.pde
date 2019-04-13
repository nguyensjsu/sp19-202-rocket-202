/**
 * Login screen class
 */ 
public class LoginScreen implements IProxy, IAuthSubject, IKeyPadObserver{
	KeyPad kp;
	PinSet ps;
	IDisplayComponent chain;
	IAuthObserver observer;

    public LoginScreen(){
      kp = new KeyPad();
	  ps = new PinSet();
	  chain = ps;
	  ps.setNext(kp);
    }
    
	/**
	* display method 
	*/ 
    public void display(){
      chain.display();
    }
	
    /**
	* touch method
	*/ 
    public void touch(){
      chain.touch();
    }
	
	/**
	* Add observer to subject
	*/ 
	public void addObserver(IAuthObserver au){
		observer = au;
	}
	
	/**
	* notify observer
	*/ 
	public void notifyObserver(){
		observer.loginUpdate();
	}
}
