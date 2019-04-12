
public class AppProxy {
  boolean authenticated;
  IProxy login;
  IProxy app;
  
  public AppProxy() {
    authenticated = false;
    login = new LoginScreen();
	app = new AppController();
    
  }
  
  public void display() {
    if(!authenticated) login.display();
    else app.display();
  }
  
  public void touch(){
    if(!authenticated)  login.touch();
    else app.touch();
  }
}
