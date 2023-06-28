function buy() payable returns (uint amount) {
  amount = msg.value / buyPrice;      
  require(balanceOf[this] >= amount); 
  balanceOf[msg.sender] += amount;    
  balanceOf[this] -= amount;          
  Transfer(this, msg.sender, amount); 
  return amount;                      
}

function sell(uint amount) returns (uint revenue) {
  require(balanceOf[msg.sender] >= amount); 
  balanceOf[this] += amount;                
  balanceOf[msg.sender] -= amount;          
  revenue = amount * sellPrice;
  msg.sender.transfer(revenue);             
  Transfer(msg.sender, this, amount);       
  return revenue;                           
}
