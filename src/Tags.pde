public class Tags implements ITouchEventHandler, IDisplayComponent, IRadioButtonObserver {
    private PImage img;
    private CurrentOption co;
    private int offset;
    private boolean moveLeft;
    private boolean inMotion;
    private ITouchEventHandler nextHandler;

    public Tags(CurrentOption co) {
        this.co = co;
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
        //if (mouseY)
        if (nextHandler != null) {
            nextHandler.touch();
        }
    }

    public void setNext(ITouchEventHandler next) {
        nextHandler = next;
    }

    public void toggleExpense() {
        moveLeft = false;
        inMotion = true;

    }

    public void toggleIncome() {
        inMotion = true;
        moveLeft = true;
    }

    public void cancel() {}
}