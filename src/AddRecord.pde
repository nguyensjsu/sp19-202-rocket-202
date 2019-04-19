class AddRecordScreen implements IDisplayComponent{
    private static AddRecordScreen screen;
    private Keypad kp;
    private AddRecordScreen() {
    	kp = new Keypad(0, 300, 380, 380);
    }
    
    public static AddRecordScreen getScreen() {
        if (screen == null) {
            screen = new AddRecordScreen();
        }
        return screen;
    }
    
    public void display() {
    	size(380, 680);
    }
    
    public void addSubComponent(IDisplayComponent c) {
    }
    
}
