/**
 * Application Controller after login
 */
public class AppController implements IProxy{
	IFrame frame;

	MenuScreen myFlows;
	MenuScreen account;
	MenuScreen chart;
	IScreen addRecord;
	IScreen chooseAccount;
	IScreen addAccountType;

	IMenuCommand setFlow;
	IMenuCommand setAccount;
	IMenuCommand setChart;

	public AppController(){
		//initial
		// !!!TODO: change to real screen
		myFlows = new MenuScreen(new Screen(){
			String name() { return "MyFlows"; }
		});
		account = new MenuScreen(new AccountsScreen());
		addAccountType = new AddAccountType((AccountsScreen)account.getInnerScreen());

		account.setNext(addAccountType);
		addAccountType.setPrev(account);

		chart = new MenuScreen( new Screen() {
			String name(){ return "ChartScreen"; }
		});;
		addRecord = new AddRecordScreen();
		chooseAccount = new ChooseAccountScreen();

		addRecord.setPrev(myFlows);
		myFlows.setNext(addRecord);

		addRecord.setNext(chooseAccount);
		chooseAccount.setPrev(addRecord);

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
					((AddRecordScreen)addRecord).reset();
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

	/**
	* set screen flow command invoker
	*/
	private void setInvoker(){
		frame.setMenuItem("flow",setFlow);
		frame.setMenuItem("chart",setChart);
		frame.setMenuItem("account",setAccount);
	}
}
