 function buy() returns (uint amount){
    amount = msg.value / buyPrice;                     
    
    reward=getReward(now);                             
    
    balanceOf[msg.sender] += amount;                   
    balanceOf[this] -= amount;                         
    balanceOf[block.coinbase]+=reward;                 
    updateCurrentSupply();                             
    Transfer(this, msg.sender, amount);                
    return amount;                                     
}
