pragma solidity ^0.4.5;

contract C {
  uint u;
  function f() {
    u = 1;
  }
}

contract B is C {
  function f() {
    u = 2;
  }
}

contract A is B {
  function f() {  
    u = 3;
  }
  function f1() { 
    super.f();
  }
  function f2() { 
    B.f();
  }
  function f3() { 
    C.f();
  }
}
