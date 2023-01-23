contract A is Ownable {
  B public b;

  function A(address _bAddress) public {
    b = B(_bAddress);      
  }

  function callSomeMethodOnB() public {
    b.someMethod();
  }
}

contract B is Ownable {
  uint256 public callCounter;

  function B() public {

  }

  function someMethod() public onlyOwner {
    callCounter = callCounter + 1;
  }  
}
