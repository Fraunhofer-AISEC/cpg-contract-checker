library A {
   function doSomething() constant returns (uint) { return 10; }
   function doInternal() internal constant returns (uint) { return 99; }
}

library B {
   function doSomething() constant returns (uint) { return 2000; }
   function doInternal() internal constant returns (uint) { return 8888; }
}

contract Consumer {
   function execute() {
      uint x = A.doSomething();
      uint y = A.doInternal();
   }
}
