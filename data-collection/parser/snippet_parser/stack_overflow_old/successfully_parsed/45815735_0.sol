function sell(uint amount) returns (uint revenue){
if (balanceOf[msg.sender] < amount ) throw;        
balanceOf[this] += amount;                         
balanceOf[msg.sender] -= amount;                   
revenue = amount * sellPrice;
if (!msg.sender.send(revenue)) {                   
    throw;                                         
} else {
    Transfer(msg.sender, this, amount);             
    return revenue;                                 
}
}