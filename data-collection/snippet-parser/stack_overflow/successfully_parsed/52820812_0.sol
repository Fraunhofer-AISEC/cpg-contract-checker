function () external payable {
  require(msg.value > 0); 
  require(msg.data.length == 0);
} 
