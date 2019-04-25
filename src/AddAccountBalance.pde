import java.util.ArrayList;

public class AddAccountBalance extends Screen implements IKeyPadObserver, IAddAccountSubject {

    PImage headImage;
    private AccountType accountType;
    private double balance;
    private ArrayList<IAddAccountObserver> observers;

    public AddAccountBalance(AccountType accountType) {

        this.accountType = accountType;

        observers = new ArrayList<IAddAccountObserver>();

        headImage = loadImage("img/inputAccountBalance.jpeg");

    }

    public void display() {

        background(245);

        image(headImage, 0, 0, 380, 60);

        for(IDisplayComponent c : components) {
            c.display();
        }

    }

    public void touch() {

        if(isBack()) {
            this.prev();
        } else {
            super.touch();
        }

    }

    private boolean isBack() {
        return mouseX >= 0 && mouseX <= 40 && mouseY >= 0 && mouseY <= 50;
    }

    public void keyEventUpdate(String lastKey, String result) {

        if(lastKey == "S") {

            if(result == "")
                result = "0.00";

            balance = Double.parseDouble(result);

            Account newAccount = new Account(accountType, balance);
            notifyAddAccountObservers(newAccount);

            frame.cmd("account");

        }

    }

    public void attachAddAccountObserver(IAddAccountObserver observer) {
        observers.add(observer);
    }

    public void removeAddAccountObserver(IAddAccountObserver observer) {
        int i = observers.indexOf(observer);
        if(i >= 0)
            observers.remove(i) ;
    }

    public void notifyAddAccountObservers(Account account) {
        for(IAddAccountObserver observer : observers) {
            observer.addAccountEventHandler(account);
        }
    }
}
