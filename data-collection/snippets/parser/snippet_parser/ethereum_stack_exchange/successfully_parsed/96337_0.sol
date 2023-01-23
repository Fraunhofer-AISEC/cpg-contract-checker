
function withdraw() public returns (bool) {
    uint amount = pendingReturns[msg.sender];
    if (amount > 0) {
        
        
        
        pendingReturns[msg.sender] = 0;

        if (!payable(msg.sender).send(amount)) {
            
            pendingReturns[msg.sender] = amount;
            return false;
        }
    }
    return true;
}

