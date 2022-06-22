contract BInterface {
  function foo() public; 
}

contract B is BInterface {
   function foo() public {
     
   }
}

contract C {
  BInterface b;
  function doBFoo() public {
    b.foo();
  }
}
