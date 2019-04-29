public class ContextChart {
    private IChartStrategy chartStrategy;

    public ContextChart(IChartStrategy chartStrategy) {
        this.chartStrategy = chartStrategy;
    }

    public void display(){
        chartStrategy.display();
    }
    
    public void hide(){
      chartStrategy.hide();
    }
    
    public void show(){
      chartStrategy.show();
    }
	
	public void drag(){
      chartStrategy.drag();
    }
    
}
