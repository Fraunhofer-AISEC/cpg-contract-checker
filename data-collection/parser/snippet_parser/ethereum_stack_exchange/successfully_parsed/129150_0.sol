pragma solidity >=0.8.14;

contract A {
  function foo() external returns(bool) { return true; }
}

contract B {
  function callFoo(A _addr) public view returns(bool) {
    try _addr.foo() returns(bool) {
      return true;
    } catch(bytes memory err) {
      return false;
    }
  }
}
