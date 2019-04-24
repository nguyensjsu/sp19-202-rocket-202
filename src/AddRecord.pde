class AddRecordScreen extends Screen implements IRadioButtonObserver {

    private KeyPad kp;
    private CurrentOption co;
    private OutputText ot;
    private RadioButton rb;
    private Tags tags;

    public AddRecordScreen() {
        rb = new RadioButton();
        co = new CurrentOption();
        ot = new OutputText(360, 90, 250, 150);
        tags = new Tags(co);
        kp = new KeyPad(0, 430, 380, 250);
        kp.attach(ot);
        rb.attach(this);
        rb.attach(tags);
        addSubComponent(rb);
        addSubComponent(co);
        addSubComponent(ot);
        addSubComponent(tags);
        addSubComponent(kp);
    }

    public void display() {
        super.display();


        line(0, 380, 380, 380);
        //fill(255);
        /*
        fill(255);
        rectMode(CORNER);
        stroke(0,0,247);
        rect(100, 10, 90, 30, 10, 0, 0, 10);
        fill(0,0,247);
        rect(190, 10, 90, 30, 0, 10,10,0);

        textAlign(LEFT);
        textSize(15);
        fill(0,0,247);
        text("Expense", 117, 30);
        fill(255);
        text("Income", 210, 30);
        fill(60);
        line(0, 50, 380, 50);
        line(0, 350, 380, 350);

        //stoke(60);
        //rect(330, 15, 20, 20);
        stroke(40, 40, 62);
        line(339, 18, 353, 32);
        line(339, 32, 353, 18);
        */
    }

    public void toggleExpense() {}

    public void toggleIncome() {}

    public void cancel() {
        frame.cmd("flow");
    }

}
