class AddAcountType extends Screen implements IDisplayComponent, ITouchEventHandler {

    PImage headImage;
    PImage addCardImage;
    PImage addCashImage;
    PImage addPaypalImage;

    private AccountsScreen accountsScreen;
    private IScreen prev;

    public AddAcountType(AccountsScreen accountsScreen) {

        this.accountsScreen = accountsScreen;

        headImage = loadImage("img/selectAccountType.jpeg");
        addCardImage = loadImage("img/addCardAccount.jpeg");
        addCashImage = loadImage("img/addCashAccount.jpeg");
        addPaypalImage = loadImage("img/addPaypalAccount.jpeg");

    }

    public void display() {

        background(245);

        image(headImage, 0, 0, 380, 60);

        textSize(12);
        textAlign(CENTER, CENTER);
        fill(80);
        text("Account Type", 45, 85);

        image(addCardImage, 0, 100, 380, 60);
        image(addCashImage, 0, 160, 380, 60);
        image(addPaypalImage, 0, 220, 380, 60);

    }

    public void touch() {

        if(isBack()) {
            this.prev();
            return;
        }

        if(mouseY >= 100 && mouseY <= 280) {

            AccountType accountType = getSelectedType();

            AddAccountBalance addAccountBalance = new AddAccountBalance(accountType);
            addAccountBalance.setPrev(this);
            addAccountBalance.setNext((IScreen)accountsScreen);
            
            addAccountBalance.attachAddAccountObserver(accountsScreen);

            OutputText inputAmountText = new OutputText(240, 130, 45);
            addAccountBalance.addSubComponent(inputAmountText);

            KeyPad keyPad = new KeyPad(0, 400, 380, 280);
            addAccountBalance.addSubComponent(keyPad);
            
            keyPad.attach(inputAmountText);
            keyPad.attach(addAccountBalance);

            frame.setCurrentScreen(addAccountBalance);

        }

    }

    private AccountType getSelectedType() {

        if(mouseY >= 100 && mouseY < 160) {
            return AccountType.CARD;
        } else if(mouseY < 220) {
            return AccountType.CASH;
        } else {
            return AccountType.PAYPAL;
        }

    }

    private boolean isBack() {

        return mouseX >= 8 && mouseX <= 20 && mouseY >= 25 && mouseY <= 45;

    }

    public void setPrev(IScreen prev) {

        this.prev = prev;

    }

    public void prev() {

        if(prev != null)
            frame.setCurrentScreen(prev);

    }

    public void addSubComponent(IDisplayComponent c) {

    }

    public void setNext(ITouchEventHandler next) {

    }
}
