modifier paidEnough(uint _price) { 
  require(msg.value >= _price, "Not enough payment sent"); 
  _;
}

function buyItem(uint sku) public payable forSale(sku) paidEnough(items[sku].price) checkValue(sku) { 
  items[sku].seller.transfer(items[sku].price); 
  items[sku].buyer = msg.sender; 
  items[sku].state = State.Sold; 
  
  emit LogSold(sku); 
}
