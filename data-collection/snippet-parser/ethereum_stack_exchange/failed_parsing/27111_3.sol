function hasNonZeroBalance(address addr) returns (bool) {
    return balances[addr].balance != 0;
}

modifier isOkay(address addr) {
    if (!hasNonZeroBalance(addr))
        throw;
    _;
}

function whatever() isOkay(msg.sender) {
    
}

function other_function() {
    
    if (hasNonZeroBalance(msg.sender)) {
        
    }
}
