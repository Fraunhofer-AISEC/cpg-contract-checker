contract A{
   event Invoked();
   function invoke() public returns(bool){
      Invoked();
      return true;
   }
}

contract B{
   function B() {
      new A().invoke()
   }
}
