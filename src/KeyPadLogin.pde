/**
 * Key Pad for loagin
 */
class KeyPadLogin implements IKeyPadLoginSubject, ITouchEventHandler, IDisplayComponent{ 
	int center_x = width/2;
	int center_y = 380;
	int distance = 80;
	PImage[][][] num = new PImage[3][3][2];
	PImage[] num0 = new PImage[2];
	PImage[] numx = new PImage[2];
	int[] ind = {0,1,2};
	int img_w = 60;
	int img_h = 60;
	int shock = 0;
	ArrayList<IKeyPadLoginObserver> list;
  ITouchEventHandler next;
	
	public KeyPadLogin(){
		list = new ArrayList<IKeyPadLoginObserver>();
		int n = 1;
		for(int i : ind){
			for(int j : ind){
				num[i][j][0] = loadImage("img/num"+Integer.toString(n)+".png");
				num[i][j][1] = loadImage("img/nump"+Integer.toString(n)+".png");
				n++;
			}
		}
		num0[0] = loadImage("img/num0.png");
		num0[1] = loadImage("img/nump0.png");
		numx[0] = loadImage("img/numx.png");
		numx[1] = loadImage("img/numpx.png");
	}
	
	/**
	* display method
	*/
	public void display(){
		int x,y;
		PImage[] img;
		for(int i : ind){
			for(int j :ind){
				x = center_x + shock + (j-1)*distance;
				y = center_y +(i-1)*distance;
				img = num[i][j];
				display_img(x,y,img);			
			}
		}
		display_img(center_x + shock, center_y  + 2*distance, num0); 
		display_img(center_x + shock + 1*distance, center_y + 2*distance, numx); 
		reduceShock();
	}
	
	/**
	* display single image 
	*/
	private void display_img(int x, int y, PImage[] img){
		imageMode(CENTER);
		if(checkP(x,y) && mousePressed) image(img[1], x, y, img_w, img_h);
		else image(img[0], x, y, img_w, img_h);
		//println(x,y);
	}
	
	/**
	* touch method
	*/
	public void touch(){
		int x,y;
		String var;
		println("touch event");
		for(int i : ind){
			for(int j :ind){
				x = center_x + (j-1)*distance;
				y = center_y + (i-1)*distance;
				if(checkP(x, y)) {
					notifyObserver(Integer.toString(3*i+j+1));	
					println(Integer.toString(3*j+i+1));
				}					
			}
		}
		if(checkP(center_x, center_y + 2*distance)) notifyObserver("0");
		if(checkP(center_x + 1*distance, center_y + 2*distance)) notifyObserver("X");
	}
	
	/**
	* check whether mouse stay on the image
	*/	
	private boolean checkP(int x, int y){
		if(mouseX < (x + img_w/2) && mouseX > (x - img_w/2) && mouseY < (y + img_h/2) && mouseY > (y - img_h/2)){
			return true;
		}
		else return false;
	}
	
	/**
	* notify observer
	*/
	private void notifyObserver(String str){
		println("Touch:"+ str );
		for(IKeyPadLoginObserver obs : list) obs.updateEvent(str);
	}
	
	/**
	* set subject
	*/
	public void setSubject(IKeyPadLoginObserver obs){
		list.add(obs);
	}
	
	/**
	* Set next component of display chain
	*/ 
	public void setNext(ITouchEventHandler next){
		this.next = next;
	}
	
	/**
	* add shock to keypad
	*/ 
	public void addShock(){
		shock = 25;
	}
	
	/**
	* reduce shock effect
	*/ 
	public void reduceShock(){
		shock = shock*9/10*-1;
	}

  public void addSubComponent(){}
}
