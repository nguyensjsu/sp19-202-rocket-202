public interface IFrame {

    // Set current screen.
    void setCurrentScreen(IScreen s);

    // Set menu item.
  //  void setMenuItem(String slot, IMenuCommand c);

    // Handle touch event.
    void touch();

    // Handle drag.
    void drag();

    // Jump to previous page.
    void prev();

    // Jump to next page.
    void next();

    // Execute cmd.
    void cmd(String c);

    // Display screen name.
    String screen();

    // Display current screen.
    void display();
}
