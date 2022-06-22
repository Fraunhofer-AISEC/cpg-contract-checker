function transferToOwner() payable returns (bool) {
    
    require(msg.value > 1 ether);
    uint amountToSend = 1 ether;
    uint change = msg.value - amountToSend; 
    
    owner.transfer(1 ether);
    return true;
}
