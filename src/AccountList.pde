import java.util.ArrayList;

/**
 * Load Account List from accounts.csv.
 */
public class AccountList {

    private String filePath;
    private ArrayList<Account> accounts;

    public AccountList() {
        accounts = new ArrayList<Account>();
        filePath = "data/accounts.csv";
    }

    public Account get(int index) {
        if (index < accounts.size()) {
            return accounts.get(index);
        }
        System.out.println("Account index out of range.");
        return null;
    }

    /**
     * Construct account from string.
     * @param  String line    A record in accounts.csv
     * @return Account        Account Created
     */
    private Account readFromString(String line) {
        System.out.println(line);
        String[] acc = line.split(",");
        return new Account(acc[1], Double.parseDouble(acc[2]), acc[0]);
    }

    /**
     * Reload Accounts from accounts.csv
     */
    public void loadFromFile() {
        accounts.clear();
        String[] accLines = loadStrings(filePath);
        for(String line: accLines) {
            accounts.add(readFromString(line));
        };
    }

    /**
     * Save Accounts to accounts.csv
     */
    public void saveToFile() {
        ArrayList<String> lines = new ArrayList<String>();
        for (Account account : accounts) {
            lines.add(account.toString());
        }
        saveStrings(filePath, lines.toArray(new String[lines.size()]));
    }

    public void print() {
        for(Account acc : accounts) {
            System.out.println(acc.toString());
        }
    }
}