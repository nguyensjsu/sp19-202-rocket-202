interface IScreen {

    // touch event
    void touch();

    // draw of screen
    void display();

    // screen name
    String name();

    // set reference for frame
    void setFrame(IFrame frame);

    // remove current screen from frame
    void freeFrame();

    // jump to next screen.
    void next();

    // jump to previous screen.
    void prev();

    // if this screen include a menubar
    boolean hasMenu();
}
