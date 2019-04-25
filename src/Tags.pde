public class ExpenseStrategy implements ITagsStrategy {

    public ExpenseStrategy() {}

    public String touch() {
        if (mouseY > 140 && mouseY < 225) {
            if (mouseX < 95) {
                return "FOOD";
            } else if (mouseX < 190) {
                return "SHOPPING";
            } else if (mouseX < 285) {
                return "ENTERTAINMENT";
            } else {
                return "HEALTH";
            }
        }
        if (mouseY > 250 && mouseY < 340) {
            if (mouseX < 95) {
                return "HOUSEHOLD";
            } else if (mouseX < 190) {
                return "INSURANCE";
            } else if (mouseX < 285) {
                return "TRANSPORTATION";
            } else {
                return "OTHERS";
            }

        }
       return "";
    }
}

public class IncomeStrategy implements ITagsStrategy {
    public IncomeStrategy() {};
    public String touch() {
        if (mouseY > 140 && mouseY < 225) {
            if (mouseX < 95) {
                return "SALARY";
            } else if (mouseX < 190) {
                return "RED_PACKET";
            } else if (mouseX < 285) {
                return "REFUND";
            } else {
                return "CASH";
            }
        }
        if (mouseY > 250 && mouseY < 340) {
            if (mouseX < 95) {
                return "REWARDS";
            } else if (mouseX < 190) {
                return "OTHERS";
            }
        }
       return "";
    }
}

public class Tags implements ITouchEventHandler, IDisplayComponent, IRadioButtonObserver {
    private PImage img;
    private ITagsObserver observer;
    private int offset;
    private boolean moveLeft;
    private boolean inMotion;
    private ITouchEventHandler nextHandler;
    private ITagsStrategy expStrategy, incStrategy, currentStrategy;

    public Tags(ITagsObserver o) {
        expStrategy = new ExpenseStrategy();
        incStrategy = new IncomeStrategy();
        currentStrategy = expStrategy;
        observer = o;
        img = loadImage("img/tags.png");
        offset = 0;
        inMotion = false;
        moveLeft = false;
    }

    public void display() {
        imageMode(CORNER);
        if (inMotion) {
            if (moveLeft) {
                if (offset > -380) {
                    offset -= 20;
                }
            } else {
                if (offset < 0) {
                    offset += 20;
                }
            }
        }
        image(img, 0 + offset, 106, 760, 275);


    }

    public void addSubComponent(IDisplayComponent c) {}

    public void touch() {
        if (mouseY > 106 && mouseY < 381) {
            observer.touchTag(currentStrategy.touch());
        } else if (nextHandler != null) {
            nextHandler.touch();
        }
    }

    public void setNext(ITouchEventHandler next) {
        nextHandler = next;
    }

    public void toggleExpense() {
        moveLeft = false;
        inMotion = true;
        currentStrategy = expStrategy;

    }

    public void toggleIncome() {
        inMotion = true;
        moveLeft = true;
        currentStrategy = incStrategy;
    }

    public void cancel() {}
}