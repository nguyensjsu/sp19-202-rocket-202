public class ShowList{
  
  public ShowList(){
    
  }
  
  public void singleList(float h,String s1, String s2, String s3){
    line(0,h,380,h);
    h = h+20;
    textSize(20);
    textAlign(LEFT, CENTER);
    fill(0,0,0);
    text(s1,10,h);
    textAlign(CENTER, CENTER);
    text(s2,190,h);
    textAlign(RIGHT, CENTER);
    text(s3,360,h);
  }

}
