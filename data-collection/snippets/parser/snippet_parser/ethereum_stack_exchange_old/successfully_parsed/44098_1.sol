function pay2() public payable {
    require(msg.value > 0);
    balanceOf[msg.sender] = msg.value;
    elaborateTopX(msg.sender, msg.value);
}

function elaborateTopX(address addr, uint currentValue) private {
    uint i = 0;
    
    for(i; i < topBalances.length; i++) {
        if(topBalances[i].balance < currentValue) {
            break;
        }
    }
    
    for(uint j = topBalances.length - 1; j > i; j--) {
        topBalances[j].balance = topBalances[j - 1].balance;
        topBalances[j].addr = topBalances[j - 1].addr;
    }
    
    topBalances[i].balance = currentValue;
    topBalances[i].addr = addr;
}
