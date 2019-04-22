public class ContextCSVChart {
    private IChartCSVStrategy chartCSVStrategy;

    public ContextCSVChart(IChartCSVStrategy chartCSVStrategy) {
        this.chartCSVStrategy = chartCSVStrategy;
    }

    public void excuteCSVStrategy(String filename){
        chartCSVStrategy.calculateTotaldata();
        chartCSVStrategy.writeData(filename);
    }
}
