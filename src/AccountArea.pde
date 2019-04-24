/**
 * AccountArea in AddRecord Screen.
 */
public class AccountArea implements ITouchEventHandler, IDisplayComponent {

    private IAccountAreaObserver observer;
    private ITouchEventHandler nextHandler;
    private Account account;

    public AccountArea(Account acc) {
        account = acc;
    }

    /**
     * set account.
     * @param String account Account Type.
     */
    public void setAccount(Account acc) {
        account = acc;
    }

    public Account getAccount() {
        return account;
    }


    public String getID() {
        return account.getID();
    }


    /**
     * display current screen.
     */
    public void display() {
        fill(255);
        stroke(0,0,247);
        rectMode(CORNER);
        rect(120, 397, 80, 25, 10, 10, 10, 10);
        fill(0,0,247);
        textSize(15);
        textAlign(CENTER, CENTER);
        text(account.getType(), 160, 408);
    }

    /**
     * touch event.
     */
    public void touch() {
        if (mouseY > 397 && mouseY < 422) {
            if (mouseX > 120 && mouseX < 200) {
                System.out.println("touch");
                observer.chooseAccount();
            }
        } else if (nextHandler != null) {
            nextHandler.touch();
        }
    }

    public void attach(IAccountAreaObserver o) {
        observer = o;
    }

    /**
     * set next touch event handler.
     */
    public void setNext(ITouchEventHandler next) {
        nextHandler = next;
    }

    /**
     * not used.
     */
    public void addSubComponent(IDisplayComponent c) {
    }



}