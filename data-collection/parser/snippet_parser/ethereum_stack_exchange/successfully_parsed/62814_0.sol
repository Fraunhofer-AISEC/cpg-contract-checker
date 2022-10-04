contract KYCPurchase {
  uint public price = 2 ether;
  address[] public buyer;

  function buy() public payable {
    require(msg.value >= price);

    
    buyer.push(msg.sender);

  }
}