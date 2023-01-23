contract example1 {
  function A() {
    print msg.sender; 
    example3.C();
  }
}

contract example2 {
  function B() internal {
    print msg.sender; 
  }
}

contract example3 is example2 {
  function C() {
    print msg.sender;
    B();
  }
}
