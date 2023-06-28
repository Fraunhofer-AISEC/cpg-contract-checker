function cancelOrder(bytes32 ticker, uint id) external {
  
  


  
  
  

  require(orderBook[ticker][id].length > 0, "Invalid ticker or Id");

  
  

  
  
  

 cancelOrder[ticker][id] = true;

}
