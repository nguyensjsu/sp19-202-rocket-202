import java.math.BigDecimal;
/**
 * Each Flow Item interface
 */
public interface IFlowItem
{
    String typeName();
    BigDecimal value();
    String imgPath();
}
