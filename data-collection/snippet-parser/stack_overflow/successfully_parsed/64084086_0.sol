
contract A {
  uint256 someData = 3

  function foo() public view returns (uint256) {
    
  }
}

contract B {
  A public a;

  function bar() public {
    
    uint256 ret = a.foo()  
  }
}

