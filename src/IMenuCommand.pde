/**
 * Menu command interface
 */ 
interface IMenuCommand{
	/**
	* excute command
	*/ 
	void excute();
	
	/**
	* set receiver
	*/ 
	void setReciver(IMenuReciver target);
}
