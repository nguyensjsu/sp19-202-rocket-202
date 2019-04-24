/**
 * Login screen class
 */
public class LoginScreen implements IProxy, IAuthSubject, IKeyPadLoginObserver{
	private KeyPadLogin kp;
	private IAuthObserver observer;
	private PinSet current;
	private String passcode;
	private String temp;

	private PinSet ls;
	private PinSet cs;
	private PinSet ss;
	private PinSet es;

    public LoginScreen(){
      kp = new KeyPadLogin();

	  ls = new LoginState();
	  cs = new CheckState();
	  ss = new ResetState();
	  es = new ReenterState();
	  current = ls;
	  passcode = "1234"; // default passcode

	  ls.setNext(kp);
	  cs.setNext(kp);
	  ss.setNext(kp);
	  es.setNext(kp);

	  ls.setClient(this);
	  cs.setClient(this);
	  ss.setClient(this);
	  es.setClient(this);

	  kp.setSubject(this);
    }

	/**
	* display method
	*/
    public void display(){
      background(240);
      current.display();
      kp.display();
    }

    /**
	* touch method
	*/
    public void touch(){
      current.touch();
    }

	/**
	* drag method
	*/
    public void drag(){
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

	/**
	* set pin state
	*/
	public void setState(PinSet s){
		current = s;
	}

	/**
	* return login state
	*/
	public PinSet returnLogin(){
		return ls;
	}

	/**
	* return check state
	*/
	public PinSet returnCheck(){
		return cs;
	}

	/**
	* return reset state
	*/
	public PinSet returnReset(){
		return ss;
	}

	/**
	* return re-enter state
	*/
	public PinSet returnReenter(){
		return es;
	}

	/**
	* verify passcode
	*/
	public boolean check(String str){
		println(str,"  ", passcode);
		if (str.equals(passcode)) return true;
		else return false;
	}

	/**
	* add shock to key pad
	*/
	public void addShock(){
		kp.addShock();
	}

	/**
	* set tempory passcode
	*/
	public void setTemp(String str){
		temp = str;
	}

	/**
	* verify tempory passcode
	*/
	public boolean checkTemp(String str){
		println(str,"  ", temp);
		if(!temp.isEmpty() && temp.equals(str)){
			passcode = temp;
			return true;
		}
		else return false;
	}

	/**
	* code update for pin set
	*/
	public void updateEvent(String str){
		current.update(str);
	}
}
