import java.util.UUID;

enum AccountType {
    CARD,
    CASH,
    PAYPAL
}

class Account {

    public String type;
    public double balance;
    public String uuid;

    public Account(AccountType type, double balance) {
        this.type = type.name();
        this.balance = balance;
        uuid = UUID.randomUUID().toString();
    }

    public Account(String type, double balance, String uuid) {
        this.type = type;
        this.balance = balance;
        this.uuid = uuid;
    }

    /**
     * (NOT USED) Change Account Type
     * @param accountType Account Type
     */
    public void changeType(AccountType accountType) {
    }

    /**
     * (NOT USED) Change Account Balance
     * @param amount Amount to Change
     * @param operator The Operator, '+' or '-'
     */
    public void changeBalance(double amount, char operator) {
    }

}
