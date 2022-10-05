function buyCarrotsFromSeller(address _seller) payable {
  uint carrotsToBuy = carrotPrice / msg.value; 

  require(carrots[_seller] >= carrotsToBuy);

  carrots[_seller] -= carrotsToBuy;
  carrots[msg.sender] += carrotsToBuy;

  
  _seller.transfer(msg.value);
}
