public class ContextChart {
    private IChartStrategy chartStrategy;

    public ContextChart(IChartStrategy chartStrategy) {
        this.chartStrategy = chartStrategy;
    }

    public void display(){
        chartStrategy.display();
    }
    
}
