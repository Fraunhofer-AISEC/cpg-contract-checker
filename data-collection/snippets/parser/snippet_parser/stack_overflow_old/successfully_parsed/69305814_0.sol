function Donar() external payable{
    require(msg.value >= MINIMUM, "Minium amount is 0.05");
    bool nuevo = false;
    
    blockValue =  uint256(blockhash(block.number-1));
    
    if(balances[msg.sender]<=0){
        users.push(msg.sender);
        nuevo = true;
    }
    balances[msg.sender] +=msg.value;
    emit Donation(msg.sender, balances[msg.sender], nuevo);
}
