/**
 * Application Controller after login
 */
public class AppController implements IProxy{
	IFrame frame;

	IScreen myFlows;
	IScreen account;
	IScreen chart;
	IScreen addRecord;

	IMenuCommand setFlow;
	IMenuCommand setAccount;
	IMenuCommand setChart;

	public AppController(){
		//initial
		// !!!TODO: change to real screen
		myFlows = new Screen();
		account = new Screen();
		chart = new Screen();
		addRecord = new AddRecordScreen();

		frame = new Frame(myFlows);

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
	};

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
		setAccount = new MenuCommand();
		setChart = new MenuCommand();

		setFlow.setReciver(new IMenuReceiver() {
			public void doAction() {
				// !!!TODO: Change Name of Flow Scrren
				if (frame.screen().equals("MyFlows")) {
					frame.setCurrentScreen(addRecord);
				} else {
					frame.setCurrentScreen(myFlows);
				}
			}
		});

		setAccount.setReciver(new IMenuReceiver() {
			public void doAction() {
				frame.setCurrentScreen(account);
			}
		});

		setChart.setReciver(new IMenuReceiver() {
			public void doAction() {
				frame.setCurrentScreen(chart);
			}
		});
	}

	/**a
	* set screen flow command invoker
	*/
	private void setInvoker(){
		frame.setMenuItem("flow",setFlow);
		frame.setMenuItem("chart",setChart);
		frame.setMenuItem("account",setAccount);
	}
}
