public class ShowList{
  int y = 300;
  public ShowList(){
    
  }
  
  public void singleList(float h,String s1, String s2, String s3){
    stroke(0);
	line(0,h,380,h);
    h = h+20;
    textSize(20);
    textAlign(LEFT, CENTER);
    fill(0,0,0);
    text(s1,10,h,-50);
    textAlign(CENTER, CENTER);
    text(s2,190,h,-50);
    textAlign(RIGHT, CENTER);
    text(s3,360,h,-50);
  }
  
  public int showBottomList(String[] fieldSets, float[] dataSetFloat, float[] dataSets,int displacemant){
    String percent;
	int end = 0;
    for(int i=0; i< fieldSets.length; i++){
      if(String.valueOf(dataSetFloat[i]*100).length()<=5){
        percent = String.valueOf(dataSetFloat[i]*100)+"%";
      } else {
        percent = String.valueOf(dataSetFloat[i]*100).substring(0,5)+"%";
      }
      
      singleList(y+30*i+20*i+displacemant, fieldSets[i],  percent, String.valueOf(dataSets[i]));
	  end = y+30*i+20*i+displacemant+20;
    }
	return end;
  }

}
