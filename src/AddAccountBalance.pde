import java.util.ArrayList;

public class AddAccountBalance extends Screen
        implements IDisplayComponent, ITouchEventHandler, IKeyPadObserver, IAddAccountSubject {

    PImage headImage;

    private AccountType accountType;
    private double balance;
    private IScreen prev;
    private IScreen next;
    private ITouchEventHandler chain;

    private ArrayList<IAddAccountObserver> observers;
    private ArrayList<IDisplayComponent> subComponents;

    public AddAccountBalance(AccountType accountType) {

        this.accountType = accountType;
        
        observers = new ArrayList<IAddAccountObserver>();
        subComponents = new ArrayList<IDisplayComponent>();

        headImage = loadImage("img/inputAccountBalance.jpeg");

    }

    public void display() {

        background(245);

        image(headImage, 0, 0, 380, 60);

        for(IDisplayComponent c : subComponents) {
            c.display();
        }

    }

    public void touch() {

        if(isBack()) {
            this.prev();
        } else {
            if(chain != null)
                chain.touch();
        }

    }

    public void addSubComponent(IDisplayComponent c) {

        subComponents.add(c);
        
        if (subComponents.size() == 1) {
            chain = (ITouchEventHandler)c;
        } else {
            ITouchEventHandler prev = (ITouchEventHandler)subComponents.get(subComponents.size() - 2);
            prev.setNext((ITouchEventHandler)c);
        }

    }

    private boolean isBack() {
        return mouseX >= 8 && mouseX <= 20 && mouseY >= 25 && mouseY <= 45;
    }

    public void setNext(ITouchEventHandler next) {
        chain = next;
    }

    public void setNext(IScreen next) {
        this.next = next;
    }

    public void next() {

        if(next != null)
            frame.setCurrentScreen(next);

    }

    public void setPrev(IScreen prev) {
        this.prev = prev;
    }

    public void prev() {

        if(prev != null)
            frame.setCurrentScreen(prev);

    }

    public void keyEventUpdate(String lastKey, String result) {

        if(lastKey == "S") {
            
            if(result == "")
                result = "0.00";
          
            balance = Double.parseDouble(result);

            Account newAccount = new Account(accountType, balance);
            notifyAddAccountObservers(newAccount);
            
            next();

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
