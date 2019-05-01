
public interface IChartCSVStrategy {
    void calculateTotaldata();
    void writeData(String filename);
    String getAllIncome();
    String getAllOutcome();
    String getAllBalance();
}
