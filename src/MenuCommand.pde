/**
 * Menu command class
 */
public class MenuCommand implements IMenuCommand{
	IMenuReceiver target;

	/**
	* excute command
	*/
	public void excute(){
		target.doAction();
	}

	/**
	* set receiver
	*/
	public void setReciver(IMenuReceiver target){
		this.target = target;
	}
}
