function withdraw() returns (bool) {
    var amount = pendingReturns[msg.sender];
    if (amount > 0) {
        
        
        
        pendingReturns[msg.sender] = 0;

        if (!msg.sender.send(amount)) {
            
            pendingReturns[msg.sender] = amount;
            return false;
        }
    }
    return true;
}
