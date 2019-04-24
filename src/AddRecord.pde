import java.util.Date;
import java.text.*;

class AddRecordScreen extends Screen implements IRadioButtonObserver {

    private KeyPad kp;
    private CurrentOption co;
    private OutputText ot;
    private RadioButton rb;
    private Tags tags;
    private Date date;
    private SimpleDateFormat df;

    public AddRecordScreen() {
        rb = new RadioButton();
        co = new CurrentOption("FOOD");
        ot = new OutputText(360, 90, 250, 150);
        tags = new Tags((ITagsObserver)co);
        kp = new KeyPad(0, 430, 380, 250);
        kp.attach(ot);
        rb.attach(this);
        rb.attach(tags);
        rb.attach(co);
        addSubComponent(rb);
        addSubComponent(co);
        addSubComponent(ot);
        addSubComponent(tags);
        addSubComponent(kp);
        date = new Date();
        df = new SimpleDateFormat("MM-dd");
    }

    public void display() {
        super.display();
        line(0, 390, 380, 390);
        fill(255);
        stroke(0,0,247);
        rectMode(CORNER);
        rect(20, 395, 80, 30, 10, 10, 10, 10);
        fill(0,0,247);
        textSize(15);
        textAlign(CENTER, CENTER);
        text(df.format(date), 60, 408);
    }

    public void toggleExpense() {}

    public void toggleIncome() {}

    public void cancel() {
        frame.cmd("flow");
    }

}
