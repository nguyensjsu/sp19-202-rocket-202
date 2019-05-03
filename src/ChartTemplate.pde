public abstract class ChartTemplete {

  abstract void getDataSet();
  abstract void printData();
  abstract void setback();
  abstract void createChart();
  abstract void printImg();
  abstract void drag();

  public final void display(){
    background(255);
    getDataSet();
    printData();
    printImg();
    setback();
    noStroke();
    createChart();
 }

}
