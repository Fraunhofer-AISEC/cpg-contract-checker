contract Counter {
  uint public counter;
  address public provider;
    
  constructor(address addr) {
    counter = 0;
    provider = addr;
  }

  function newvalue() public {
    counter += Provider(provider).provide();
  }
}
