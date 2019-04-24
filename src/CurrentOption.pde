import java.util.Hashtable;

public class CurrentOption implements ITouchEventHandler, IDisplayComponent, ITagsObserver, IRadioButtonObserver {
    private ITouchEventHandler nextHandler;
    private Hashtable images;
    private PImage img;
    private String text;

    public CurrentOption(String option) {
        images = new Hashtable();
        images.put("OTHERS", loadImage("img/others.png"));
        images.put("SHOPPING", loadImage("img/shopping.png"));
        images.put("ENTERTAINMENT", loadImage("img/entertainment.png"));
        images.put("HEALTH", loadImage("img/health.png"));
        images.put("HOUSEHOLD", loadImage("img/household.png"));
        images.put("TRANSPORTATION", loadImage("img/transportation.png"));
        images.put("INSURANCE", loadImage("img/insurance.png"));
        images.put("SALARY", loadImage("img/salary.png"));
        images.put("RED_PACKET", loadImage("img/red_packet.png"));
        images.put("REFUND", loadImage("img/refund.png"));
        images.put("CASH", loadImage("img/cash.png"));
        images.put("REWARDS", loadImage("img/rewards.png"));
        images.put("FOOD", loadImage("img/food.png"));

        img = (PImage)images.get(option);
        text = option;
    }


    /**
     * get current option.
     * replace "-" with " " for RED_PACKET
     * @return String current opiton.
     */
    public String getOption() {
        return text.replace(" ", "_");
    }

    public void display() {
        imageMode(CORNER);
        image(img, 10, 60, 40, 40);
        textAlign(LEFT, CENTER);
        textSize(15);
        fill(60);
        text(text.toUpperCase(), 60, 78);
        stroke(220, 220, 220);
        line(0, 105, 380, 105);
    }

    public void addSubComponent(IDisplayComponent c) {}

    public void touch() {
        if (nextHandler != null) {
            nextHandler.touch();
        }
    }

    public void setNext(ITouchEventHandler next) {
        nextHandler = next;
    }

    /**
     * touch Event for certain tag.
     * @param  String name  Tag Name.
     */
    public void touchTag(String name) {
        if (images.containsKey(name)) {
            img = (PImage)images.get(name);
            text = name.replace("_", " ");
        } else {
            System.out.println("touchTag, 66 : key does not exist");
        }
    }

    /**
     * execute when switch to expense.
     */
    public void toggleExpense() {
        touchTag("FOOD");
    }


    /**
     * execute when switch to income.
     */
    public void toggleIncome() {
        touchTag("SALARY");
    }

    public void cancel() {}
}