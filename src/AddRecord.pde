import java.util.Date;
import java.text.*;
import java.io.File;

class AddRecordScreen extends Screen implements IRadioButtonObserver, IAccountAreaObserver, IKeyPadObserver {

    private KeyPad kp;
    private CurrentOption co;
    private OutputText ot;
    private RadioButton rb;
    private Tags tags;
    private AccountArea aa;
    private Date date;
    private SimpleDateFormat df;
    private AccountList accList;
    private int msgCounter;
    private String filePath;

    public AddRecordScreen() {
        filePath = "data/records.csv";
        accList = new AccountList();
        accList.loadFromFile();
        rb = new RadioButton();
        co = new CurrentOption("FOOD");
        ot = new OutputText(360, 90, 250, 150);
        tags = new Tags((ITagsObserver)co);
        aa = new AccountArea(accList.get(0));
        kp = new KeyPad(0, 430, 380, 250);
        kp.attach(this);
        kp.attach(ot);
        rb.attach(this);
        rb.attach(tags);
        rb.attach(co);
        aa.attach(this);
        addSubComponent(rb);
        addSubComponent(co);
        addSubComponent(ot);
        addSubComponent(tags);
        addSubComponent(aa);
        addSubComponent(kp);
        date = new Date();
        df = new SimpleDateFormat("MM-dd");
    }

    /**
     * Reset the Screen to initial status.
     */
    public void reset() {
        rb.reset();
        co.toggleExpense();
        kp.reset();
        accList.loadFromFile();
        aa.setAccount(accList.get(0));
        msgCounter = 0;
        date = new Date();
    }

    /**
     * Add date area in display.
     * Date area does not handle touch event for now.
     */
    public void display() {
        super.display();
        stroke(220, 220, 220);
        line(0, 390, 380, 390);
        fill(255);
        stroke(0,0,247);
        rectMode(CORNER);
        rect(20, 397, 80, 25, 10, 10, 10, 10);
        fill(0,0,247);
        textSize(15);
        textAlign(CENTER, CENTER);
        text(df.format(date), 60, 408);
        if (msgCounter > 0) {
            msgCounter -= 1;
            fill(60, 150);
            noStroke();
            rect(110, 220, 160, 30, 10, 10, 10, 10);
            fill(255);
            text("Amount can't be 0.", 189, 233);
        }

    }

    public void toggleExpense() {}

    public void toggleIncome() {}

    public void cancel() {
        frame.cmd("flow");
    }

    /**
     * when touch AccountArea, jump to ChooseAccount Screen.
     */
    public void chooseAccount() {
        next();
    }

    public void keyEventUpdate(String k, String result) {
        if (k.equals("S")) {
            if (ot.getText().equals("0.00")) {
                msgCounter = 70;
            } else {
                createRecord();
            }
        }
    }

    /**
     * create a record.
     */
    public void createRecord() {
        // change account
        Account acc = aa.getAccount();
        double amount = Double.parseDouble(ot.getText());
        acc.change(rb.getType() ? -amount : amount);
        accList.saveToFile();

        // append record
        String record = date.getTime() + "," + (rb.getType() ? "TRUE":"FALSE") + "," + co.getOption() + "," + ot.getText() + "," + aa.getID();
        String[] records = loadStrings(filePath);
        String[] records_new = append(records, record);
        saveStrings(filePath, records_new);
        System.out.println(record);

        // navigate
        prev();
    }

}
