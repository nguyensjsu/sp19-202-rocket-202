class LineChartPlot{
	int x,y;
	int month = Calendar.getInstance().get(Calendar.MONTH)+1;
	int length = 240;
	int maxV=-1;
	int markX = width/2-90;
	
	//X position:Center, Y position: Top
	public LineChartPlot(int x, int y){
		this.x = x-length/2;
		this.y = y;
	}
	
	public void getData(float[] yPayment, color c, String name){
		
		for(int i = 0; i < yPayment.length-1; i++){
			stroke(c);
			line(x+length/11*i,getYPosition(yPayment[i]), x+length/11*(i+1),getYPosition(yPayment[i+1]));
			fill(0);
			circle(x+length/11*i,getYPosition(yPayment[i]),3);
		}
		point(x+length,getYPosition(yPayment[11]));
		rectMode(CENTER);
		fill(c);
		rect(markX,y-20,20,10);
		fill(0);
		textAlign(CENTER,CENTER);
		textSize(10);
		text(name,markX+35,y-20);
		markX+=90;
	}
		
	public void printAxis(){
		markX = width/2-90;
		println(maxV);
		int s = 15;
		int c = 126;
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
		text("Money", -(y+length/2), x-30);
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
		for(int i = 0; i < 5; i++){
			textAlign(CENTER,CENTER);
			text(maxV-i*maxV/4, x-10, y+length/4*i);
			line(x,y+length/4*i,x+3,y+length/4*i);
		}
	}
	
	private int getYPosition(float num){
		return Math.round(y+length - num/maxV*length);
	}

	public void getMax(float[] yPayment){
	for (int counter = 0; counter < yPayment.length; counter++)
			{
				 if (yPayment[counter] > maxV)
				 {
				  maxV = Math.round(yPayment[counter]);
				 }
			}
	}
}
