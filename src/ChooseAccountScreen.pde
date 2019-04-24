public class ChooseAccountScreen extends Screen {
    private boolean firstTime = true;
    public ChooseAccountScreen() {
    }

    public void display() {
        if (firstTime) {
            fill(60, 50);
            noStroke();
            rect(0, 0, 380, 680);
            firstTime = false;
        }
    }

    public void touch() {
        System.out.println("ChooseAccount");
        prev();
    }

    public void prev() {
        firstTime = true;
        super.prev();
    }

    public void next() {
        firstTime = true;
        super.next();
    }
}