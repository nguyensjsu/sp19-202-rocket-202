import java.util.ArrayList;

public class RadioButton implements IDisplayComponent, ITouchEventHandler {

    private ITouchEventHandler nextHandler;
    private boolean radioOption;
    private ArrayList<IRadioButtonObserver> observers;
    PImage expImg, incImg;

    public RadioButton() {
        radioOption = true;
        expImg = loadImage("img/expense.png");
        incImg = loadImage("img/income.png");
        observers = new ArrayList<IRadioButtonObserver>();
    }

    /**
    * touch method
    */
    public void touch() {
        if (mouseY < 50) {
            if (isToggleExpense()) {
                // switch to expense
                System.out.println("toggle to expense");
                radioOption = true;
                notify("expense");
            } else if (isToggleIncome()) {
                // switch to income
                System.out.println("toggle to income");
                radioOption = false;
                notify("income");
            } else if (isCancel()) {
                System.out.println("cancel");
                radioOption = true;
                notify("cancel");
            }

        } else if (nextHandler != null) {
            nextHandler.touch();
        }
    }

   /**
    * set next touch event handler
    */
    public void setNext(ITouchEventHandler next) {
        nextHandler = next;
    }

    public void display() {
        imageMode(CORNER);
        if (radioOption) {
            image(expImg, 0, 0, 380, 50);
        } else {
            image(incImg, 0, 0, 380, 50);
        }
    }

    /**
     * indicate whether touch trigger toggle to expense.
     * @return Boolean result.
     */
    private boolean isToggleExpense() {
        if (mouseY > 10 && mouseY < 40) {
            if (mouseX > 100 && mouseX < 190) {
                return !radioOption;
            }
        }
        return false;
    }

    /**
     * indicate whether touch trigger toggle to income.
     * @return Boolean result.
     */
    private boolean isToggleIncome() {
        if (isWithinRangeY()) {
            if (mouseX > 190 && mouseX < 280) {
                return radioOption;
            }
        }
        return false;
    }


    /**
     * indicate whether touch is within Y range.
     * @return Boolean result.
     */
    private boolean isWithinRangeY() {
        if (mouseY > 10 && mouseY < 40) {
            return true;
        }
        return false;
    }

    /**
     * indicate whether touch trigger cancel.
     * @return Boolean result.
     */
    private boolean isCancel() {
        return mouseY > 10 && mouseY < 40 && mouseX > 330 && mouseX < 360;
    }

    public void addSubComponent(IDisplayComponent c) {};

    public void attach(IRadioButtonObserver o) {
        observers.add(o);
    }

    private void notify(String command) {
        for (int i = 0; i < observers.size(); i ++) {
            if (command.equals("expense")) {
                observers.get(i).toggleExpense();
            } else if (command.equals("income")) {
                observers.get(i).toggleIncome();
            } else {
                observers.get(i).cancel();
            }
        }
    }

    public boolean getType() {
        return radioOption;
    }

    public void reset() {
        radioOption = true;
    }
}