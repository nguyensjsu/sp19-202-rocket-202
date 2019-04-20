class AddRecordScreen extends Screen{

    private KeyPad kp;
    public AddRecordScreen() {

    	kp = new KeyPad(0, 300, 380, 380);
    }

    public void display() {
    	size(380, 680);
    }

    public void addSubComponent(IDisplayComponent c) {
    }

}
