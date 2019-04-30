class LineChartPlot{
	int x,y;
	int month = Calendar.getInstance().get(Calendar.MONTH)+1;
	int length = 240;
	int maxV = 0;
	int minV = 0;
	int range = 0;
	int markX = width/2-90;

	/**
  * Constructor
	* @param x X position:Center
  * @param y Y position: Top
  */
	public LineChartPlot(int x, int y){
		this.x = x-length/2;
		this.y = y;
	}

	/**
	* get data to show line chart
	* @param yPayment float[] payment data
	* @param c color
	* @param name String
	* @param flag boolean
	*/
	public void getData(float[] yPayment, color c, String name, boolean flag){
		int maxG = 0;
		int minG = 0;
		int yi = 0;
		for (int counter = 0; counter < yPayment.length; counter++)
			{
				 if (yPayment[counter] > maxG)
				 {
				  maxG = Math.round(yPayment[counter]);
				 }

				 if (yPayment[counter] < minG)
				 {
				  minG = Math.round(yPayment[counter]);
				 }
			}
		for(int i = 0; i < yPayment.length-1; i++){
			stroke(c);
			line(x+length/11*i,getYPosition(yPayment[i]), x+length/11*(i+1),getYPosition(yPayment[i+1]));
			if (!flag) continue;
			setGradient(x+length/11*i,getYPosition(yPayment[i]), getYPosition(maxG), getYPosition(minG), c);
			for(int j = x+length/11*i+1; j<x+length/11*(i+1);j++){
				double yf =getYPosition(yPayment[i])+(getYPosition(yPayment[i+1])-getYPosition(yPayment[i]))/(length/11)*(j-x-length/11*i);
				println(yf);
				if(yf<getYPosition(maxG)) yi = (int)Math.floor(yf);
				else yi = (int)Math.ceil(yf);
				setGradient(j, yi, getYPosition(maxG), getYPosition(minG), c);
			}
			fill(0);
			circle(x+length/11*i,getYPosition(yPayment[i]),3);
		}
		point(x+length,getYPosition(yPayment[11]));
		rectMode(CENTER);
		fill(c);
		rect(markX+35,y-20,20,10);
		fill(0);
		textAlign(CENTER,CENTER);
		textSize(10);
		text(name,markX+35+35,y-20);
		markX+=90;
	}

	/**
  * print Axis
  */
	public void printAxis(){
		markX = width/2-90;
		println(maxV);
		int s = 15;
		int c = 100;
		//Y axis
		stroke(c);
		line(x ,y , x, y+length);
		//X axis
		stroke(c);
		line(x ,y+length , x+length, y+length);
		//YLabel
		textAlign(CENTER);
		textSize(s);
		fill(c);
		rotate(-PI/2);
		text("Money", -(y+length/2), x-40);
		//XLabel
		rotate(PI/2);
		textSize(s);
		fill(c);
		text("Month", x+length/2, y+length+30);
		// Month Value
		for(int i = 0; i < 12;i++){
			// if(month == 0) month = 12;
			textSize(s);
			fill(c);
			text(1+i, x+length/11*i, y+length+15);//?
			line(x+length/11*i,y+length-3,x+length/11*i,y+length);
			// month--;
		}
		// Money Value
		range = maxV - minV;
		for(int i = 0; i < 5; i++){
			textAlign(RIGHT,CENTER);
			text(maxV-i*range/4, x-10, y+length/4*i);
			line(x,y+length/4*i,x+3,y+length/4*i);
		}
		// zero value line
		if(minV<0){
			stroke(200);
			line(x,getYPosition(0), x+length,getYPosition(0));
			textAlign(RIGHT,CENTER);
			text(0, x-20, getYPosition(0));
		}
	}

	/**
  * Get Y axis position
  * @param num float
  * @return y axis position int
  */
	private int getYPosition(float num){
		return Math.round(y+length - (num-minV)/range*length);
	}

	/**
  * Get payment Max
  * @param yPayment float[]
  */
	public void getMax(float[] yPayment){
	for (int counter = 0; counter < yPayment.length; counter++)
			{
				 if (yPayment[counter] > maxV)
				 {
				  maxV = Math.round(yPayment[counter]);
				 }

				 if (yPayment[counter] < minV)
				 {
				  minV = Math.round(yPayment[counter]);
				 }
			}
	}

	/**
  * set Gradient
  * @param x int
  * @param y int
	* @param max int
	* @param min int
	* @param c color
  */
	private void setGradient(int x, int y, int max, int min, color c){
		int dis = 20;
		if(max == min) return;
		if(y<getYPosition(0)){
			// if(max == getYPosition(0)) return;
			for(int p = y;p<getYPosition(0);p++){
				float i = map(p,max,getYPosition(0),0,1);
				color gre = lerpColor(c,color(255,255,255),i);
				stroke(gre);
				point(x,p);
			}
		}else{
			// if(min == getYPosition(0)) return;
			for(int p = y;p>getYPosition(0);p--){
				float i = map(p,getYPosition(0),min,0,1);
				color gre = lerpColor(color(255,255,255),c,i);
				stroke(gre);
				point(x,p);
			}
		}
	}
}
