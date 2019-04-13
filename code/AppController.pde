/**
 * Application Controller after login
 */
public class AppController implements IProxy{
	Frame frame;
	
	IScreen flow;
	IScreen property;
	IScreen chart;
	
	IMenuCommand setFlow;
	IMeunCommand setProperty;
	IMEnuCommand SetChart;
	
	public AppController(){
		//initial
		frame = new Frame();
		flow = new  ;
		property = new  ;
		chart = new  ;
		
		//set receiver
		setCommand();
		
		//set Invoker
		setInvoker();
	}
   
   /**
	* touch method 
	*/ 
	public void touch(){
		frame.touch();
	}
   
   /**
	* display method
	*/ 
	public void display(){
		frame.display();
	}
 
	/**
	* drag method
	*/ 
	public void drag(){
		frame.drag();
	}
	
	/**
	* set screen flow command
	*/ 
	private void setCommand(){
		setFlow = new MenuCommand();
		setProperty = new MenuCommand();
		setChart = new MenuCommand();
		
		// build receiver
		IMenureceiver goFlow = () -> frame.setCurrentScreen(flow);
		IMenureceiver goChart = () -> frame.setCurrentScreen(chart);
		IMenureceiver goProperty = () -> frame.setCurrentScreen(property);
		
		// set receiver
		setFlow.setReceiver(goFlow);
		setChart.setReceiver(goChart);
		setProperty..setReceiver(goProperty);
	}
	
	/**
	* set screen flow command invoker
	*/ 
	private void setInvoker(){
		frame.setCommand("Flow",setFlow);
		frame.setCommand("Chart",setChart);
		frame.setCommand("Property",setProperty);
	}
}
