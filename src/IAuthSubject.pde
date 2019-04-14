/**
 * Authentication observer subject interface
 */ 
interface IAuthSubject{

	/**
	* Add observer to subject
	*/ 
  void addObserver(IAuthObserver au);
  
  /**
	* notify observer
	*/ 
  void notifyObserver();
}
