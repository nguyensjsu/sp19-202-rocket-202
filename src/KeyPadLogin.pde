/**
 * Key Pad for loagin
 */
class KeyPadLogin implements IKeyPadSubject{ //???
	int center_x = width/2;
	int center_y = 400;
	int distance = 40;
	PImage[][][] num = new PImage[3][3][2];
	PImage[] num0 = new PImage[2];
	PImage[] numx = new PImage[2];
	int[] ind = {0,1,2};
	int img_w = 40;
	int img_h = 40;
	ArrayList<IKeyPadObserver> list;
	
	public KeyPadLogin{
		list = new ArrayList<IKeyPadObserver>();
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
		nump[1] = loadImage("img/numpx.png");
	}
	
	/**
	* display method
	*/
	public void display(){
		int x,y;
		PImage[] img;
		for(int i : po){
			for(int j :po){
				x = center_x + (i-2)*distance;
				y = center_y + (i-2)*distance;
				img = num[i][j];
				display_img(x,y,img);			
			}
		}
		display_img(center_x, center_y + 2*distance, num0); 
		display_img(center_x + 1*distance, center_y + 2*distance, num0); 
	}
	
	/**
	* display single image 
	*/
	private void display_img(int x, int y, PImage[] img){
		imageMode(CENTER);
		if(checkP(x,y) && mousePressed) image(img[1], x, y, img_w, img_h);
		else image(img[0], x, y, img_w, img_h));
	}
	
	/**
	* touch method
	*/
	public touch(){
		int x,y;
		PImage[] img;
		for(int i : po){
			for(int j :po){
				x = center_x + (i-2)*distance;
				y = center_y + (i-2)*distance;
				if(checkP(x, y)) notifyObserver(Integer.toString(3*i+j+1));		
			}
		}
		if(checkP(center_x, center_y + 2*distance)) notifyObserver("0");
		if(checkP(center_x + 1*distance, center_y + 2*distance)) notifyObserver("X");
	}
	
	/**
	* check whether mouse stay on the image
	*/	
	private boolean checkP(int x, int y){
		if(mouseX < (x + img_w) && mouseX > (x - img_w) && mouseY < (y + img_h) && mouseX > (y - img_h)) return true;
		else return false;
	}
	
	/**
	* notify observer
	*/
	private void notifyObserver(String str){
		for(IKeyPadObserver obs : list) obs.doAction(str);
	}
	
	/**
	* set subject
	*/
	public void setSubject(IKeyPadObserver obs){
		list.add(obs);
	}
}
