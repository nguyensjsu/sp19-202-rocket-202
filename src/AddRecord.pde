class AddRecordScreen extends Screen{

    private KeyPad kp;
    private OutputText ot;

    public AddRecordScreen() {
        ot = new OutputText(190, 100, 250, 150);
        kp = new KeyPad(0, 400, 380, 280);
        kp.attach(ot);
        addSubComponent(ot);
        addSubComponent(kp);
    }

}
