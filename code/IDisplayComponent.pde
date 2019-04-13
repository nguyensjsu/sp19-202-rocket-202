/**
 * Display chain component interface
 */ 
interface IDisplayComponent{
	/**
	* display method
	*/ 
  void display();
	
	/**
	* add next display chain component
	*/ 
  void addNext(IDisplayComponent next);
}
