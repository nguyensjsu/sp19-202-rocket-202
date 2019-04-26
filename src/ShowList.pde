public class ShowList{
  
  public ShowList(){
    
  }
  
  public void singleList(float h,String s, int r, int g, int b){
    textSize(20);
    line(0,h,380,h);
    fill(r,g,b);
    text(s,0,h+22);
  }

}
