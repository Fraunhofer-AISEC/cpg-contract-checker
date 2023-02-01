contract MyContract {
  address public owner;

  constructor(address oracleAddress) {
      owner = msg.sender;
      priceFeed = AggregatorV3Interface(oracleAddress);
  }
  
  function transfer() public payable {
      payable(owner).transfer(msg.value);
  }
}
