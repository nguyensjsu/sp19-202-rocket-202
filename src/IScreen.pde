interface IScreen {

    // touch event
    void touch();

    // drag event
    void drag();

    // draw of screen
    void display();

    // screen name
    String name();

    // set reference for frame
    void setFrame(IFrame frame);

    // get frame reference
    IFrame getFrame();

    // remove current screen from frame
    void freeFrame();

    // jump to next screen.
    void next();

    // jump to previous screen.
    void prev();
}
