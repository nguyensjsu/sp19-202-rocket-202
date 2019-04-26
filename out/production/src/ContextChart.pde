public class ContextChart {
    private IChartStrategy chartStrategy;

    public ContextChart(IChartStrategy chartStrategy) {
        this.chartStrategy = chartStrategy;
    }

    public void excuteStrategy(String filename){
        chartStrategy.calculateTotaldata();
        chartStrategy.writeData(filename);
    }
}
