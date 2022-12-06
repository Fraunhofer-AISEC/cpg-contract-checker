function sendMoney(
  uint256 _id
  ) public payable {
  
  require(msg.value > 0, "Not enough ETH");

  address payable seller = eventticket[_id].seller;
  require(seller != address(0), "Wrong seller address");
  
  seller.transfer(msg.value);
}
