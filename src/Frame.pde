public class Frame implements IFrame {
    private IScreen current;

    IMenuInvoker menuA = new MenuOption();
    IMenuInvoker menuB = new MenuOption();
    IMenuInvoker menuC = new MenuOption();

    public Frame(IScreen init){
        current = init;
        current.setFrame(this);
    }


    // Set current screen.
    public void setCurrentScreen(IScreen s) {
        if (current != null) {
            current.freeFrame();
        }
        s.setFrame(this);
        current = s;
    }

    // Set menu item.
    public void setMenuItem(String slot, IMenuCommand c) {
        if ( "account".equals(slot) ) { menuA.setCommand(c); }
        if ( "flow".equals(slot) ) { menuB.setCommand(c); }
        if ( "chart".equals(slot) ) { menuC.setCommand(c); }
    }

    // Handle touch event.
    public void touch() {
        if (current != null) {
            current.touch();
        }
    }

    // Drag Event.
    public void drag() {
        current.drag();
    }

    // Jump to previous page.
    public void prev() {
        current.prev();
    }

    // Jump to next page.
    public void next() {
        current.next();
    }

    // Display screen name.
    public String screen() {
        return current.name();
    }

    // Display current screen.
    public void display() {
        current.display();
    }

    public void cmd(String c) {
        if ("account".equals(c)) {
            menuA.invoke();
        } else if ("flow".equals(c)) {
            menuB.invoke();
        } else if ("chart".equals(c)) {
            menuC.invoke();
        }
    }
}
