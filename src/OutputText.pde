class OutputText implements IDisplayComponent, ITouchEventHandler, IKeyPadObserver {

    private int x;
    private int y;
    private int textSize;
    private String result = "";
    private String lastKey = "";
    private ITouchEventHandler nextHandler;

    public OutputText(int x, int y, int textSize) {

        this.x = x;
        this.y = y;
        this.textSize = textSize;

    }

    public void display() {

        fill(50);
        if(result == "")
            result = "0.00";

        textSize(textSize);
        textAlign(RIGHT);
        text(result, x, y);

    }


    void touch(){
        if (nextHandler != null) {
            nextHandler.touch();
        }
    }

    /**
     * set next touch event handler
     */
    void setNext(ITouchEventHandler next){
        nextHandler = next;
    }

    public void addSubComponent(IDisplayComponent c) {}

    public void keyEventUpdate(String lastKey, String result) {
        this.lastKey = lastKey;
        this.result = result;
    }

    public String getText() {
        return result;
    }


}
