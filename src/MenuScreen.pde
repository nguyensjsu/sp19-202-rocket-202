public class MenuScreen implements IScreen {
    private IScreen screen;
    PImage img;

    public MenuScreen(IScreen s) {
        screen = s;
        if (s.name().equals("AccountsScreen")) {
            img = loadImage("img/menu_asset.png");
        } else if (s.name().equals("MyFlows")) {
            img = loadImage("img/menu_trans.png");
        } else if (s.name().equals("ChartScreen")) {
            img = loadImage("img/menu_chart.png");
        }
    }

    /**
     * get inner screen.
     * @return IScreen inner screen.
     */
    public IScreen getInnerScreen() {
        return this.screen;
    }


    // touch event
    public void touch() {
        IFrame frame = screen.getFrame();
        if (mouseY > 600) {
            if (mouseX < 127) {
                frame.cmd("account");
                System.out.println("Asset");
            } else if (mouseX < 253) {
                frame.cmd("flow");
                System.out.println("Flow");
            } else {
                frame.cmd("chart");
                System.out.println("Chart");
            }
        } else {
            screen.touch();
        }
    }

    public void drag() {
        screen.drag();
    }

    // draw of screen
    public void display() {
        screen.display();
        imageMode(CORNER);
        image(img, 0, 600, 380, 80);
    }

    // screen name
    public String name() {
        return screen.name();
    }

    // set reference for frame
    public void setFrame(IFrame frame) {
        screen.setFrame(frame);
    };

    public IFrame getFrame() {
        return screen.getFrame();
    }

    // remove current screen from frame
    public void freeFrame() {
        screen.freeFrame();
    }

    // jump to next screen.
    public void next() {
        screen.next();
    }

    // jump to previous screen.
    public void prev() {
        screen.prev();
    }

    public void setNext(IScreen s) {
        screen.setNext(s);
    }

    public void setPrev(IScreen s) {
        screen.setPrev(s);
    }

}