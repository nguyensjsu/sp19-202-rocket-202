public class ShowList{
  PImage foodimg, cashimg, entertainmentimg, healthimg, householdimg, insuranceimg, othersimg, red_packetimg, refundimg, rewardsimg, salaryimg, shoppingimg, transportationimg;
  int y = 300;
  // Constructor
  public ShowList(){
    foodimg = loadImage("img/food.png");
    cashimg = loadImage("img/cash.png");
    entertainmentimg = loadImage("img/entertainment.png");
    healthimg = loadImage("img/health.png");
    householdimg = loadImage("img/household.png");
    insuranceimg = loadImage("img/insurance.png");
    othersimg = loadImage("img/others.png");
    red_packetimg = loadImage("img/red_packet.png");
    refundimg = loadImage("img/refund.png");
    rewardsimg = loadImage("img/rewards.png");
    salaryimg = loadImage("img/salary.png");
    shoppingimg = loadImage("img/shopping.png");
    transportationimg = loadImage("img/transportation.png");
  }

  /**
  * Add line and word under chart to show list
  * @param h float height
  * @param s1 String tag name
  * @param s2 String percent
  * @param s3 String money
  */
  public void singleList(float h, String s1, String s2, String s3){
    PImage img = getImg(s1);
    stroke(0);
	  line(0,h,380,h);
    h = h+15;
    image(img,10,h-12,30,30);
    textSize(15);
    textAlign(LEFT, CENTER);
    fill(0,0,0);
    text(s1,50,h,-50);
    textAlign(CENTER, CENTER);
    text(s2,210,h,-50);
    textAlign(RIGHT, CENTER);
    text(s3,360,h,-50);
  }

  /**
  * combine single line to one bottom list
  * @param fieldSets String[] tag sets
  * @param dataSetFloat float[]
  * @param dataSets float[]
  * @param displacemant int
  * @return end height int
  */
  public int showBottomList(String[] fieldSets, float[] dataSetFloat, float[] dataSets,int displacemant){
    String percent;
    int end = 0;
    for(int i=0; i< fieldSets.length; i++){
      if(String.valueOf(dataSetFloat[i]*100).length()<=5){
        percent = String.valueOf(dataSetFloat[i]*100)+"%";
      } else {
        percent = String.valueOf(dataSetFloat[i]*100).substring(0,5)+"%";
      }
      singleList(y+20*i+15*i+displacemant, fieldSets[i],  percent, String.valueOf(dataSets[i]));
	  end = y+20*i+15*i+displacemant+20;
    }
	return end;
  }

  /**
  * get tag icon
  * @param str String tag name
  * @return PImage return tag icon
  */
  public PImage getImg(String str){
    PImage returnImg = null;
    switch(str){
      case "FOOD": returnImg = foodimg; break;
      case "CASH": returnImg = cashimg; break;
      case "ENTERTAINMENT": returnImg = entertainmentimg; break;
      case "HEALTH": returnImg = healthimg; break;
      case "HOUSEHOLD": returnImg = householdimg; break;
      case "INSURANCE": returnImg = insuranceimg; break;
      case "OTHERS": returnImg = othersimg; break;
      case "RED_PACKET": returnImg = red_packetimg; break;
      case "REFUND": returnImg = refundimg; break;
      case "REWARDS": returnImg = rewardsimg; break;
      case "SALARY": returnImg = salaryimg; break;
      case "SHOPPING": returnImg = shoppingimg; break;
      case "TRANSPORTATION": returnImg = transportationimg; break;
    }
    return returnImg;
  }

}
