public class ChartMain {
    public static void main(String[] args) {
        ContextChart contextChart = new ContextChart(new PieChart("2019-04",true));
        contextChart.excuteStrategy("src/record/PieChartForOutcome.csv");
    }
}
