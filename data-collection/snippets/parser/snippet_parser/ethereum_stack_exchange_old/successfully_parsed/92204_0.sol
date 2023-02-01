contract Foo {
  function checkSomething () private pure returns (bool) {
    
    return true;
  }
  
  modifier isSomething () {
    require(checkSomething());
    _;
  }
  
  modifier isNotSomething () {
    require(!checkSomething());
    _;
  }
}
