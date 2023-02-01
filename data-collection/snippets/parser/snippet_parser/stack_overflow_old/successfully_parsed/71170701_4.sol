contract Test {
   event someEvent(string _someString);
   function doSomething()public external {      
      emit someEvent("This is some event");
   }
}
