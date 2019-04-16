/**
 * App login proxy
 */
public class AppProxy implements IAuthObserver, IProxy{
  boolean authenticated;
  IProxy login;
  IProxy app;
  
  public AppProxy() {
    authenticated = false;
    login = new LoginScreen();
	app = new AppController();
	((IAuthSubject)login).addObserver(this);
    
  }
  
  /**
	* display method
	*/ 
  public void display() {
    if(!authenticated) login.display();
    else app.display();
  }
  
	/**
	* touch method
	*/ 
  public void touch(){
    if(!authenticated)  login.touch();
    else app.touch();
  }
  
  /**
	* drag method
	*/ 
  public void drag(){
	 if(authenticated) app.drag();
  }
  
  /**
	* observer event
	* update authentication state
	*/ 
  public void loginUpdate(){
	  authenticated = true;
  }
}
