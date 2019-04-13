/**
 * Touch  event handler interface
 */ 
interface ITouchEventHandler{
	/**
	* touch method
	*/ 
   void touch();
   
   /**
	* set next touch event handler
	*/ 
   void setNext(ITouchEventHandler next);
}
