public class CurrentOption implements ITouchEventHandler, IDisplayComponent{
    private ITouchEventHandler nextHandler;
    private PImage img;
    private String text;

    public CurrentOption() {
        img = loadImage("img/others.png");
        text = "transportation";
    }


    public void changeOption(String option) {
        img = loadImage("img/" + option.toLowerCase() + ".png");
        text = option;
    }

    public void display() {
        imageMode(CORNER);
        image(img, 10, 60, 40, 40);
        textAlign(LEFT, CENTER);
        textSize(15);
        text(text.toUpperCase(), 60, 78);
        stroke(220, 220, 220);
        line(0, 105, 380, 105);
    }

    public void addSubComponent(IDisplayComponent c) {}

    public void touch() {
        if (nextHandler != null) {
            nextHandler.touch();
        }
    }

    public void setNext(ITouchEventHandler next) {
        nextHandler = next;
    }
}