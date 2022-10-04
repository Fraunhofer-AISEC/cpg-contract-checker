contract A {
  ...
  function doSomething() public payable {
     
     
     contractB.doSomethingElse();
  }
}

contract B {
  ...
  function doSomethingElse() public {
     
     
     contractC.doLastThing();
  }
}

contract C {
  ...
  function doLastThing() public {
    
    
  }
}
