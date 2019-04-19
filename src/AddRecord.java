class AddRecordScreen implements IDisplayComponent{
    private static AddRecordScreen screen;
    private AddRecordScreen() {
    }
    
    public static AddRecordScreen getScreen() {
        if (screen == null) {
            screen = new AddRecordScreen();
        }
        return screen;
    }
    
    public void display() {
    	
    }
    
    public void addSubComponent(IDisplayComponent c) {
    }
    
}
