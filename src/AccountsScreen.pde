import java.text.DecimalFormat;
import java.util.ArrayList;

class AccountsScreen extends Screen implements IDisplayComponent, ITouchEventHandler, IAddAccountObserver {

    PImage headImage;
    PImage totalImage;
    PImage cardImage;
    PImage cashImage;
    PImage paypalImage;
    PImage addAccountImage;

    private ArrayList<Account> accountList;
    private DecimalFormat df = new DecimalFormat("0.00");
    // FIXME: Using relative path doesn't work. Cannot find this file
    private String accountsCSVFile = "data/accounts.csv";

    public AccountsScreen() {

        accountList = parseCSVContents(CSVHelper.readFile(accountsCSVFile));

        headImage = loadImage("img/asset.jpeg");
        totalImage = loadImage("img/total.jpeg");
        cardImage = loadImage("img/cardAccountBG.jpeg");
        cashImage = loadImage("img/cashAccountBG.jpeg");
        paypalImage = loadImage("img/paypalAccountBG.jpeg");
        addAccountImage = loadImage("img/addAccount.jpeg");

    }

    public void display() {

        accountList = parseCSVContents(CSVHelper.readFile(accountsCSVFile));

        background(245);

        image(headImage, 0, 0, 380, 60);
        image(totalImage, 0, 60, 380, 60);

        String asset = df.format(getTotalAsset());
        textSize(25);
        fill(17, 100, 163);
        textAlign(CENTER, CENTER);
        // TODO: Here I manually set the asset's coordinate.
        //       Improve this if there is a better way.
        text(asset, 322, 88);

        // FIXME: Here I suppose accounts number will not exceed the height of
        //        screen. Would be better if use a drag down panel here.
        int height = 120;
        for(Account account : accountList) {
            displayAccount(account, 0, height, 380, 60);
            height += 60;
        }

        image(addAccountImage, 0, height, 380, 60);

    }

    public void touch() {

        if(mouseY >= getAddAccountYStart() && mouseY < (getAddAccountYStart() + 60)) {

            AddAcountType addAcountType = new AddAcountType(this);
            addAcountType.setPrev(this);

            frame.setCurrentScreen(addAcountType);

        }

    }

    public ArrayList<Account> parseCSVContents(ArrayList<String> source) {

        ArrayList<Account> results = new ArrayList<Account>();

        for(String s : source) {

            // Line format in CSV file looks like:
            // <uuid>, <type>, <balance>
            String[] attributes = s.split(",");

            String uuid = attributes[0];
            String type = attributes[1];
            double balance = Double.parseDouble(attributes[2]);

            Account account = new Account(type, balance, uuid);

            results.add(account);

        }

        return results;

    }

    public void writeCSV(String fileName) {

        ArrayList<String> contents = new ArrayList<String>();

        for(Account account : accountList) {
            contents.add(account.toString());
        }

        CSVHelper.writeFile(fileName, contents);

    }

    public void displayAccount(Account account, int x, int y, int w, int h) {

        switch (AccountType.valueOf(account.type)) {
            case CARD:
                image(cardImage, x, y, w, h);
                break;
            case CASH:
                image(cashImage, x, y, w, h);
                break;
            case PAYPAL:
                image(paypalImage, x, y, w, h);
                break;
            default:
                System.err.println("Unsupported account type " + account.type);
                return;
        }

        textSize(25);
        fill(255);
        textAlign(CENTER, CENTER);
        // TODO: Here we manually set the asset's coordinate.
        //       Improve this if there is a better way.
        text(df.format(account.balance), 320, y + 28);

    }

    private int getAddAccountYStart() {

        return ((2 + accountList.size()) * 60);

    }

    public double getTotalAsset() {

        double totalAsset = 0.00;

        for(Account account : accountList) {
            totalAsset += account.balance;
        }

        return totalAsset;

    }

    public void addAccountEventHandler(Account account) {

        accountList.add(account);

        CSVHelper.appendFile(accountsCSVFile, account.toString());

    }

    public void addSubComponent(IDisplayComponent c) {

    }

    public void setNext(ITouchEventHandler next) {

    }

}
