contract Test {
  address testAddress;
  constructor() {
    testAddress = msg.sender;
  }

  
  function test() public onlyOwner {

  }

  
  modifier onlyOwner() {
    require(msg.sender == testAddress);
    _;
  }
}
