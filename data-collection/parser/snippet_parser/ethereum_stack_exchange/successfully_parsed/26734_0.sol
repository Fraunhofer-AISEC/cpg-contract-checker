contract StrangeToken {

  uint256 private repurchasePrice;   
  mapping(address => uint256) balances;

  function setPrice(uint256 price) {   
   repurchasePrice = price;   
  }  
}
