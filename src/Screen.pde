
public class Screen implements IScreen, IDisplayComponent {
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>();
    private ITouchEventHandler chain;
    protected IFrame frame;

    public Screen() {

    }

    public void touch() {
        //System.out.println(mouseX + " " + mouseY);
        if (chain != null) {
            chain.touch();
        }
    }

    public String name() {
        //System.out.println(this.getClass().getName());
        return (this.getClass().getName()).split("\\$")[1] ;
    }

    // override if needed
    public void display() {
        //background(255);
        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    public void setFrame(IFrame frame) {
        this.frame = frame;
    }

    public IFrame getFrame() {
        return frame;
    }

    public void freeFrame() {
        frame = null;
    }
    // to be override
    public void next() {}
    public void prev() {}
    public void drag() {}

    public void addSubComponent(IDisplayComponent c) {
        components.add(c);
        if (components.size() == 1) {
            chain = (ITouchEventHandler)c;
        } else {
            ITouchEventHandler prev = (ITouchEventHandler)components.get(components.size() - 2);
            prev.setNext((ITouchEventHandler)c);
        }
    }
}
