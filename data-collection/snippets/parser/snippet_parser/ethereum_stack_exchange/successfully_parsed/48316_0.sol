function transferToOwner() payable returns (bool) {
    
    require(msg.value > 1 ether);
    uint amountToSend = 1 ether;
    uint change = msg.value - amountToSend;
    msg.sender.transfer(change); 
    owner.transfer(1 ether);
    return true;
}
