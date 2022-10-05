function buy() payable returns (uint amount){
    amount = msg.value / buyPrice;            
    if (balanceOf[this] < amount) throw;      
    balanceOf[msg.sender] += amount;          
    balanceOf[this] -= amount;                
    Transfer(this, msg.sender, amount);       
    return amount;                            
}
