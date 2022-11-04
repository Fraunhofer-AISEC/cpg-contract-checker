contract B {

  A a; 

  function B(address aAddress) public { 
    a = A(aAddress);
  }

  function getSomethingFromA() public view returns(bytes32 theThing) {
    return a.something();
  }
}
