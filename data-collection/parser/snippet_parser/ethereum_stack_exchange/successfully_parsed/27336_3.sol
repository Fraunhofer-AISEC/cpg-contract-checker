function participate() payable{ 
    uint256 amount = msg.value/(10**18);
    uint256 decimalPart = msg.value%(10**18);
    
    msg.sender.transfer(decimalPart);
    
 }
