import java.util.ArrayList;

public class ChooseAccountScreen extends Screen {
    private boolean firstTime = true;
    private AccountList list;
    private int lineHeight;
    private ArrayList<Account> accounts;
    private PImage cardImg, ppImg, cashImg;

    public ChooseAccountScreen() {
        lineHeight = 60;
        cardImg = loadImage("img/card_logo.png");
        ppImg = loadImage("img/paypal_logo.png");
        cashImg = loadImage("img/cash_logo.png");
    }

    /**
     * set AccountList to display
     * @param AccountList aa AccountList
     */
    public void setAccountList(AccountList aa) {
        list = aa;
        accounts = list.getList();
    }

    public void display() {
        if (firstTime) {
            fill(60, 50);
            noStroke();
            rect(0, 0, 380, 680);
            firstTime = false;
            displayAccounts();
        }
    }

    /**
     * diaplay choose accounts area.
     * can't have way to many accounts.
     */
    public void displayAccounts() {
        drawBackground();
        drawAccounts();
        drawCheckmark();
    }

    private void drawAccounts() {
        int height = lineHeight * (accounts.size() + 1);
        int baseline = 680 - height;
        // Accounts
        baseline += lineHeight;
        String type;
        int imgSize = lineHeight * 2 / 3;
        int padding = lineHeight / 6;
        for (int i = 0; i < accounts.size(); i++) {
            // logo
            type = accounts.get(i).getType();
            if (type.equals("CASH")) {
                image(cashImg, padding, baseline + padding, imgSize, imgSize);
            } else if (type.equals("PAYPAL")) {
                image(ppImg, padding, baseline + padding, imgSize, imgSize);
            } else if (type.equals("CARD")) {
                image(cardImg, padding, baseline + padding, imgSize, imgSize);
            }
            // text
            fill(60);
            textSize(15);
            textAlign(LEFT);
            text(type, imgSize + 2 * padding, baseline + 35);
            textSize(12);
            fill(180);
            text(String.format("%s:%.2f", "balance: ", accounts.get(i).getBalance()), imgSize + 2 * padding, baseline + 52);
            stroke(220, 220, 220);
            line(0, baseline, 380, baseline);
            baseline += lineHeight;
        }
    }

    private void drawBackground() {
        int height = lineHeight * (accounts.size() + 1);
        int baseline = 680 - height;
        noStroke();
        fill(255);
        rect(0, baseline, 380, 680);
        // chooseAccount
        fill(60);
        textAlign(CENTER, CENTER);
        text("CHOOSE ACCOUNT", 190, baseline + lineHeight / 2);
    }

    private void drawCheckmark() {
        int imgSize = lineHeight * 2 / 3;
        int padding = lineHeight / 6;
        int y = 680 - (int)(lineHeight * (accounts.size() - list.getIndex() - 0.5)) + 10;
        int x = 380 - imgSize/2 - padding;
        strokeWeight(2);
        stroke(0, 0, 247);
        line(x-7, y-8, x, y);
        line(x+13, y-15, x, y);
        strokeWeight(1);
    }

    public void touch() {
        int baseline = 680 - lineHeight * accounts.size();
        if (mouseY > baseline) {
            int index = (mouseY - baseline) / lineHeight;
            System.out.println(index);
            list.setIndex(index);
        }
        prev();
    }

    public void prev() {
        firstTime = true;
        super.prev();
    }

    public void next() {
        firstTime = true;
        super.next();
    }
}