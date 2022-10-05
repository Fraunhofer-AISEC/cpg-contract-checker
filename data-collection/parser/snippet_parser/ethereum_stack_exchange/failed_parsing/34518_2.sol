contract A{
   event Invoked();
   function invoke() public returns(bool){
      Invoked();
      return true;
   }
}

contract B{
    event Created(address newContract);   
      function createA() public returns(addressCreated, bool invoked)) {
        A a = new A();
        Created(a);
        bool success = a.invoke();
        return (a, success);
   }
}
